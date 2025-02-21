<?php

namespace App\Filament\Resources\ZoneResource\Pages;

use App\Filament\Resources\ZoneResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditZone extends EditRecord
{
    protected static string $resource = ZoneResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }

    protected function mutateFormDataBeforeSave(array $data): array
    {
        // Example: Ensure coordinates are saved as WKT
        if (isset($data['coordinates'])) {
            $data['coordinates'] = DB::raw("ST_GeomFromText('{$data['coordinates']}')");
        }

        return $data;
    }
}
