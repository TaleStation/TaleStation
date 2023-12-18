import { useBackend } from '../backend';
<<<<<<< HEAD
import { NtosWindow } from '../layouts';
import { Button, Box, NoticeBox, Stack } from '../components';
=======
import { Button, Image, NoticeBox, Stack } from '../components';
import { NtosWindow } from '../layouts';
>>>>>>> 6ccb751678c11 (Updates eslint + sorts imports (#80430))

export const NtosCamera = (props) => {
  return (
    <NtosWindow width={400} height={350}>
      <NtosWindow.Content scrollable>
        <NtosCameraContent />
      </NtosWindow.Content>
    </NtosWindow>
  );
};

export const NtosCameraContent = (props) => {
  const { act, data } = useBackend();
  const { photo, paper_left } = data;

  if (!photo) {
    return (
      <NoticeBox>
        Phototrasen Images - Tap (right-click) with your tablet to snap a photo!
      </NoticeBox>
    );
  }

  return (
    <Stack fill vertical>
      <Stack.Item>
        <Button
          fluid
          content="Print photo"
          disabled={paper_left === 0}
          onClick={() => act('print_photo')}
        />
      </Stack.Item>
      <Stack.Item>
        <Box as="img" src={photo} />
      </Stack.Item>
    </Stack>
  );
};
