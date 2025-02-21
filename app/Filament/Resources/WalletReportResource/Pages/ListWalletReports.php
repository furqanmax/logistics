<?php

namespace App\Filament\Resources\WalletReportResource\Pages;

use App\Filament\Resources\WalletReportResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListWalletReports extends ListRecords
{
    protected static string $resource = WalletReportResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
