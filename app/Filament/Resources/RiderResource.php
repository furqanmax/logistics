<?php

namespace App\Filament\Resources;

use App\Filament\Resources\RiderResource\Pages;
use App\Filament\Resources\RiderResource\RelationManagers;
use App\Models\Rider;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Filament\Forms\Components\Wizard;

class RiderResource extends Resource
{
    protected static ?string $model = Rider::class;

    protected static ?string $navigationIcon = 'heroicon-o-rocket-launch';
    protected static ?string $navigationGroup = 'Delivery';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([

                Forms\Components\Section::make('Personal Information')
                    ->icon('heroicon-m-identification')
                    ->schema([
                        Forms\Components\TextInput::make('title')
                            ->required(),
                        Forms\Components\TextInput::make('mobile')
                            ->required()
                            ->tel()
                            ->maxLength(10),
                        Forms\Components\TextInput::make('email')
                            ->required()
                            ->email(),
                        Forms\Components\TextInput::make('password')
                            ->required()
                            ->password(),
                        
                        Forms\Components\Select::make('status')
                            ->label('Category Status')
                            ->options([
                                1 => 'Published',
                                0 => 'Unpublished',
                            ])
                            ->required()->columnSpanFull(),
                        Forms\Components\FileUpload::make('rimg')->label('Rider Image')
                            ->required()
                            ->columnSpanFull(),
                    ])->columns(2),
                

                    Forms\Components\Section::make('General Information')
                    ->schema([

                        Forms\Components\Select::make('vehiid')
                            ->relationship('vehicle','title')
                            ->label('Select Vehicle Type')
                            ->searchable()
                            ->preload(),

                        Forms\Components\TextInput::make('lcode')
                            ->maxLength(255),

                        
                        Forms\Components\TextInput::make('commission')
                            ->required()
                            ->numeric(),

                        Forms\Components\TextInput::make('rate')
                            ->required()
                            ->numeric(),
                        
                        Forms\Components\TextInput::make('rstatus')
                            ->required()
                            ->numeric()
                            ->default(1),

                    ])->columns(2)->collapsible(),
                
               
               
                
                
                
               
                

             

                


                
                
                // Forms\Components\TextInput::make('accept')
                //     ->required()
                //     ->numeric()
                //     ->default(0),
                // Forms\Components\TextInput::make('reject')
                //     ->required()
                //     ->numeric()
                //     ->default(0),
                // Forms\Components\TextInput::make('complete')
                //     ->required()
                //     ->numeric()
                //     ->default(0),
              
               

                   
                Forms\Components\Section::make('Address Information')
                    ->description('Address Information')
                    ->aside()
                    ->icon('heroicon-m-home')
                        ->schema([
                            Forms\Components\Textarea::make('full_address')
                                ->required(),
                            Forms\Components\TextInput::make('pincode')
                                ->required()
                                ->maxLength(255),
                            Forms\Components\Textarea::make('landmark')
                                ->required(),
                        ])->columns(1),

                Forms\Components\Section::make('Delivery Zone')
                ->description('Select a deilvery zone')
                ->aside()
                ->icon('heroicon-m-map-pin')
                    ->schema([
                        Forms\Components\Select::make('dzone')
                            ->relationship('zone','title')
                            ->label('Select Delivery Zone')
                            ->searchable()
                            ->preload()
                            ->required(),
                    ]),
                  
                Forms\Components\Section::make('Payout Information')
                ->description('Enter you bank details for payout')
                ->aside()
                ->icon('heroicon-m-banknotes')
                    ->schema([
                        Forms\Components\TextInput::make('bank_name')
                        ->required(),
                    Forms\Components\TextInput::make('ifsc')
                        ->required(),
                    Forms\Components\TextInput::make('receipt_name')
                        ->required(),
                    Forms\Components\TextInput::make('acc_number')
                        ->required(),
                    Forms\Components\TextInput::make('paypal_id'),
                    Forms\Components\TextInput::make('upi_id'),
                    ])->columns(2)


                

            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('status')
                    ->label('Category Status')
                    ->badge()
                    ->formatStateUsing(fn ($state) => $state === 1 ? 'Published' : 'Unpublished')
                    ->color(fn (string $state): string => match ($state) {
                        '1' => 'success',
                        '0' => 'danger',
                    })
                    ->sortable(),
                Tables\Columns\TextColumn::make('rate')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('lcode')
                    ->searchable(),
                Tables\Columns\TextColumn::make('pincode')
                    ->searchable(),
                Tables\Columns\TextColumn::make('commission')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('rstatus')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('mobile')
                    ->searchable(),
                Tables\Columns\TextColumn::make('accept')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('reject')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('complete')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('dzone')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('vehiid')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('created_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('updated_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
            ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }

    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListRiders::route('/'),
            'create' => Pages\CreateRider::route('/create'),
            'edit' => Pages\EditRider::route('/{record}/edit'),
        ];
    }
}
