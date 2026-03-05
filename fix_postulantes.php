<?php
$file = 'public/dashboard/postulantes/index.html';
$content = file_get_contents($file);

// 1. Replace Top Container
$oldTopPattern = '/<div class="mb-8 flex items-center justify-between">.*?candidatesLoading">.*?<\/div>\s*<\/div>/s';
$newTop = '<!-- Page Top White Block -->
                <div class="bg-white rounded-2xl shadow-sm border border-gray-200 p-8 mb-8 flex flex-col md:flex-row md:items-center justify-between gap-6">
                    <div>
                        <h2 class="text-3xl font-bold leading-7 text-gray-900 tracking-tight mb-2">
                            Postulantes invitados
                        </h2>
                        <p class="text-sm text-gray-500 font-medium">
                            Conoce el estado de quienes están realizando evaluaciones actualmente.
                        </p>
                    </div>
                    <button type="button" onclick="window.location.href=\'../create_candidate.html\'"
                        class="inline-flex items-center justify-center rounded-full bg-black px-6 py-3 text-sm font-bold text-white shadow-sm hover:bg-gray-800 transition-colors shrink-0">
                        <i class="ph ph-paper-plane-tilt mr-2 text-lg"></i> Invitar
                    </button>
                </div>

                <!-- Lista de Postulantes Table UI -->
                <div class="bg-white shadow-sm sm:rounded-2xl border border-gray-200 overflow-x-auto w-full">
                    <div class="p-5 border-b border-gray-100 flex items-center justify-between bg-white min-w-[700px]">
                        <h3 class="text-base font-bold text-gray-800">Lista de postulantes</h3>
                        <div class="relative w-64 hidden sm:block">
                            <i class="ph ph-magnifying-glass absolute left-3 top-2.5 text-gray-400"></i>
                            <input type="text" placeholder="Buscar postulante"
                                class="w-full pl-9 pr-4 py-2 text-sm border border-gray-200 rounded-full focus:outline-none focus:ring-1 focus:ring-black placeholder-gray-400">
                        </div>
                    </div>

                    <div id="candidatesContainer" class="w-full min-h-[300px] relative">
                        <div class="p-6 text-center text-gray-500 py-12 absolute inset-0 flex flex-col items-center justify-center" id="candidatesLoading">
                            <i class="ph ph-spinner animate-spin text-4xl mb-3 text-gray-300"></i>
                            <p>Cargando postulantes...</p>
                        </div>
                    </div>
                </div>';

$content = preg_replace($oldTopPattern, $newTop, $content);

// 2. Replace JS Render String
$oldTablePattern = '/let tableHTML = `.*?divide-y divide-gray-200 bg-white">.*?`;/s';
$newTable = 'let tableHTML = `
                <table class="min-w-full divide-y divide-gray-100 bg-white">
                    <thead class="bg-gray-50/50">
                        <tr>
                            <th scope="col" class="py-4 pl-6 pr-3 text-left text-xs font-bold text-gray-500 uppercase tracking-widest bg-gray-50/80">Postulante</th>
                            <th scope="col" class="px-3 py-4 text-left text-xs font-bold text-gray-500 uppercase tracking-widest bg-gray-50/80">Estado de Examen</th>
                            <th scope="col" class="px-3 py-4 text-left text-xs font-bold text-gray-500 uppercase tracking-widest bg-gray-50/80">Fecha de Invitación</th>
                            <th scope="col" class="px-3 py-4 text-right text-xs font-bold text-gray-500 uppercase tracking-widest bg-gray-50/80 pr-6">Acciones</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-gray-100 bg-white">
            `;';

$content = preg_replace($oldTablePattern, $newTable, $content);

// 3. Replace JS Loop Content
$oldLoopPattern = '/tableHTML \+= `\s*<tr.*?<\/tr>\s*`;/s';
$newLoop = 'tableHTML += `
                    <tr class="hover:bg-gray-50 transition-colors">
                        <td class="whitespace-nowrap py-5 pl-6 pr-3 text-sm">
                            <div class="font-bold text-gray-900 text-base mb-1">${c.name ? c.name : \'<i>Buscando nombre...</i>\'}</div>
                            <span class="text-xs text-gray-500 font-normal">${c.email}</span>
                        </td>
                        <td class="whitespace-nowrap px-3 py-5 text-sm text-gray-500">${statusBadge}</td>
                        <td class="whitespace-nowrap px-3 py-5 text-sm text-gray-500">
                            <i class="ph ph-calendar-blank text-indigo-400 mr-1"></i> ${new Date(c.createdAt).toLocaleDateString()}
                        </td>
                        <td class="whitespace-nowrap py-5 pl-3 pr-6 text-right text-sm font-medium">
                            ${c.usedAt ? `
                                <button class="text-indigo-600 hover:text-indigo-900 font-bold" onclick="alert(\'Descargando reporte de ${c.email}\')">PDF Reporte</button>
                            ` : `
                                <button class="w-8 h-8 rounded-full border border-gray-200 text-gray-500 hover:text-black hover:border-black inline-flex items-center justify-center transition-colors" title="Copiar Link" onclick="copyLink(\'${c.token}\')"><i class="ph ph-copy text-lg"></i></button>
                            `}
                        </td>
                    </tr>
                `;';

$content = preg_replace($oldLoopPattern, $newLoop, $content);

file_put_contents($file, $content);
echo "Replaced contents inside Postulantes index view successfully.";
