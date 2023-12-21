import { Button, Stack } from '../../../../../components';
import { Feature, FeatureValueProps } from '../base';

export const language: Feature<undefined, undefined> = {
  name: 'Access Languages',
  component: (props: FeatureValueProps<undefined, undefined>) => {
    const { act } = props;

    return (
      <Stack>
        <Stack.Item>
          <Button content="Open" onClick={() => act('open_language_picker')} />
        </Stack.Item>
      </Stack>
    );
  },
};
