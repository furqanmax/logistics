<?php

namespace App\Filament\Resources\ParcelDataResource\Pages;

use App\Filament\Resources\ParcelDataResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditParcelData extends EditRecord
{
    protected static string $resource = ParcelDataResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}
