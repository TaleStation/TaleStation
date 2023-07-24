import { sortBy } from 'common/collections';
import { classes } from 'common/react';
import { useLocalState, useBackend } from '../../backend';
import { Flex, Button, Stack, AnimatedNumber } from '../../components';
import { formatSiUnit } from '../../format';
import { MaterialIcon } from './MaterialIcon';
import { Material } from './Types';

// by popular demand of discord people (who are always right and never wrong)
// this is completely made up
const MATERIAL_RARITY: Record<string, number> = {
  'glass': 0,
  'iron': 1,
  'plastic': 2,
  'titanium': 3,
  'plasma': 4,
  'silver': 5,
  'gold': 6,
  'uranium': 7,
  'diamond': 8,
  'bluespace crystal': 9,
  'bananium': 10,
};

export type MaterialAccessBarProps = {
  /**
   * All materials currently available to the user.
   */
  availableMaterials: Material[];

  /**
   * Definition of how much units 1 sheet has.
   */
  SHEET_MATERIAL_AMOUNT: number;

  /**
   * Invoked when the user requests that a material be ejected.
   */
  onEjectRequested?: (material: Material, quantity: number) => void;
};

/**
 * The formatting function applied to the quantity labels in the bar.
 */
const LABEL_FORMAT = (value: number) => formatSiUnit(value, 0);

/**
 * A bottom-docked bar for viewing and ejecting materials from local storage or
 * the ore silo. Has pop-out docks for each material type for ejecting up to
 * fifty sheets.
 */
export const MaterialAccessBar = (props: MaterialAccessBarProps, context) => {
  const { availableMaterials, SHEET_MATERIAL_AMOUNT, onEjectRequested } = props;

  return (
    <Flex wrap>
      {sortBy((m: Material) => MATERIAL_RARITY[m.name])(availableMaterials).map(
        (material) => (
          <Flex.Item key={material.name} grow={1}>
            <MaterialCounter
              material={material}
              SHEET_MATERIAL_AMOUNT={SHEET_MATERIAL_AMOUNT}
              onEjectRequested={(quantity) =>
                onEjectRequested && onEjectRequested(material, quantity)
              }
            />
          </Flex.Item>
        )
      )}
    </Flex>
  );
};

type MaterialCounterProps = {
  material: Material;
  SHEET_MATERIAL_AMOUNT: number;
  onEjectRequested: (quantity: number) => void;
};

const MaterialCounter = (props: MaterialCounterProps, context) => {
<<<<<<< HEAD
  const { material, onEjectRequested } = props;
  const { data } = useBackend<Material>(context);
  const { SHEET_MATERIAL_AMOUNT } = data;
=======
  const { material, onEjectRequested, SHEET_MATERIAL_AMOUNT } = props;
>>>>>>> e92ae5b75b81c (Material container & related stuff ui refactors & clean-up (#76220))

  const [hovering, setHovering] = useLocalState(
    context,
    `MaterialCounter__${material.name}`,
    false
  );

<<<<<<< HEAD
  const canEject = material.amount > SHEET_MATERIAL_AMOUNT;
=======
  const sheets = material.amount / SHEET_MATERIAL_AMOUNT;
>>>>>>> e92ae5b75b81c (Material container & related stuff ui refactors & clean-up (#76220))

  return (
    <div
      onMouseEnter={() => setHovering(true)}
      onMouseLeave={() => setHovering(false)}
      className={classes([
        'MaterialDock',
        hovering && 'MaterialDock--active',
<<<<<<< HEAD
        !canEject && 'MaterialDock--disabled',
=======
        sheets < 1 && 'MaterialDock--disabled',
>>>>>>> e92ae5b75b81c (Material container & related stuff ui refactors & clean-up (#76220))
      ])}>
      <Stack vertial direction={'column-reverse'}>
        <Flex
          direction="column"
          textAlign="center"
          onClick={() => onEjectRequested(1)}
          className="MaterialDock__Label">
          <Flex.Item>
<<<<<<< HEAD
            <MaterialIcon
              materialName={material.name}
              amount={material.amount}
            />
          </Flex.Item>
          <Flex.Item>
            <AnimatedNumber value={material.amount} format={LABEL_FORMAT} />
=======
            <MaterialIcon materialName={material.name} sheets={sheets} />
          </Flex.Item>
          <Flex.Item>
            <AnimatedNumber value={sheets} format={LABEL_FORMAT} />
>>>>>>> e92ae5b75b81c (Material container & related stuff ui refactors & clean-up (#76220))
          </Flex.Item>
        </Flex>
        {hovering && (
          <div className={'MaterialDock__Dock'}>
            <Flex vertical direction={'column-reverse'}>
              <EjectButton
<<<<<<< HEAD
                material={material}
                available={material.amount}
=======
                sheets={sheets}
>>>>>>> e92ae5b75b81c (Material container & related stuff ui refactors & clean-up (#76220))
                amount={5}
                onEject={onEjectRequested}
              />
              <EjectButton
<<<<<<< HEAD
                material={material}
                available={material.amount}
=======
                sheets={sheets}
>>>>>>> e92ae5b75b81c (Material container & related stuff ui refactors & clean-up (#76220))
                amount={10}
                onEject={onEjectRequested}
              />
              <EjectButton
<<<<<<< HEAD
                material={material}
                available={material.amount}
=======
                sheets={sheets}
>>>>>>> e92ae5b75b81c (Material container & related stuff ui refactors & clean-up (#76220))
                amount={25}
                onEject={onEjectRequested}
              />
              <EjectButton
<<<<<<< HEAD
                material={material}
                available={material.amount}
=======
                sheets={sheets}
>>>>>>> e92ae5b75b81c (Material container & related stuff ui refactors & clean-up (#76220))
                amount={50}
                onEject={onEjectRequested}
              />
            </Flex>
          </div>
        )}
      </Stack>
    </div>
  );
};

type EjectButtonProps = {
<<<<<<< HEAD
  material: Material;
  available: number;
=======
>>>>>>> e92ae5b75b81c (Material container & related stuff ui refactors & clean-up (#76220))
  amount: number;
  sheets: number;
  onEject: (quantity: number) => void;
};

const EjectButton = (props: EjectButtonProps, context) => {
<<<<<<< HEAD
  const { amount, available, material, onEject } = props;
  const { data } = useBackend<Material>(context);
  const { SHEET_MATERIAL_AMOUNT } = data;
=======
  const { amount, sheets, onEject } = props;
>>>>>>> e92ae5b75b81c (Material container & related stuff ui refactors & clean-up (#76220))

  return (
    <Button
      fluid
      color={'transparent'}
      className={classes([
        'Fabricator__PrintAmount',
        amount * SHEET_MATERIAL_AMOUNT > available &&
          'Fabricator__PrintAmount--disabled',
      ])}
      onClick={() => onEject(amount)}>
      &times;{amount}
    </Button>
  );
};
