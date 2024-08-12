import { sortBy } from 'common/collections';

import { Box, Stack } from '../../../../components';
import {
  Feature,
  FeatureChoiced,
  FeatureChoicedServerData,
  FeatureColorInput,
  FeatureDropdownInput,
  FeatureValueProps,
  StandardizedDropdown,
} from './base';

type HexValue = {
  lightness: number;
  value: string;
};

type SkinToneServerData = FeatureChoicedServerData & {
  display_names: NonNullable<FeatureChoicedServerData['display_names']>;
  to_hex: Record<string, HexValue>;
};

export const feature_tajaran_tail: FeatureChoiced = {
  name: 'Tail',
  component: FeatureDropdownInput,
};

export const feature_tajaran_ears: FeatureChoiced = {
  name: 'Tajaran Ears',
  component: FeatureDropdownInput,
};

export const feature_tajaran_snout: FeatureChoiced = {
  name: 'Snout',
  component: FeatureDropdownInput,
};

export const feature_tajaran_markings: FeatureChoiced = {
  name: 'Body Markings',
  component: FeatureDropdownInput,
};

export const tajaran_body_markings_color: Feature<string> = {
  name: 'Tajaran Body Markings Color',
  component: FeatureColorInput,
};

export const lizard_body_markings_color: Feature<string> = {
  name: 'Lizard Body Markings Color',
  component: FeatureColorInput,
};

export const feature_avian_tail: FeatureChoiced = {
  name: 'Tail',
  component: FeatureDropdownInput,
};

export const feature_avian_legs: FeatureChoiced = {
  name: 'Avian Legs',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const feature_avian_leg_color: Feature<
  string,
  string,
  SkinToneServerData
> = {
  name: 'Talon Color',
  component: (props: FeatureValueProps<string, string, SkinToneServerData>) => {
    const { handleSetValue, serverData, value } = props;

    if (!serverData) {
      return null;
    }

    const sortHexValues = sortBy<[string, HexValue]>(
      ([_, hexValue]) => -hexValue.lightness,
    );

    return (
      <StandardizedDropdown
        choices={sortHexValues(Object.entries(serverData.to_hex)).map(
          ([key]) => key,
        )}
        displayNames={Object.fromEntries(
          Object.entries(serverData.display_names).map(([key, displayName]) => {
            const hexColor = serverData.to_hex[key];

            return [
              key,
              <Stack align="center" fill key={key}>
                <Stack.Item>
                  <Box
                    style={{
                      background: hexColor.value,
                      boxSizing: 'content-box',
                      height: '11px',
                      width: '11px',
                    }}
                  />
                </Stack.Item>

                <Stack.Item grow>{displayName}</Stack.Item>
              </Stack>,
            ];
          }),
        )}
        onSetValue={handleSetValue}
        value={value}
        buttons
      />
    );
  },
};
