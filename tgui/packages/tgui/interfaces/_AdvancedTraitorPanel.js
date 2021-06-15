import { useBackend, useSharedState } from '../backend';
import { Box, Button, Divider, Flex, Input, Modal, NumberInput, RoundGauge, Section, Tabs, TextArea, Tooltip } from '../components';
import { Window } from '../layouts';

export const _AdvancedTraitorPanel = (props, context) => {
  const { act, data } = useBackend(context);
  const {
    antag_type,
    finalize_text,
    goals_finalized,
    goals = [],
    backstory_tutorial_text,
    objective_tutorial_text,
    style,
    heretic_data = [],
  } = data;
  return (
    <Window
      title="Antagonist Goal Panel"
      width={1150}
      height={550}
      theme={style}>
      <Window.Content>
        <Section
          title={`${ antag_type } Background`}
          buttons={(
            <Button
              content="Tutorial: Background"
              color="good"
              onClick={() => act('begin_background_tutorial')}
            />
          )}>
          { backstory_tutorial_text && (
            <TutorialModal
              text={backstory_tutorial_text}
              tutorialAct="proceede_beginner_tutorial" />
          )}
          <AdvancedTraitorPanelBackground />
        </Section>
        <Divider />
        <Section
          title={`${ antag_type } Objectives`}
          height="60%"
          buttons={(
            <Button
              content="Tutorial: Objectives"
              color="good"
              onClick={() => act('begin_objective_tutorial')}
            />
          )}>
          { objective_tutorial_text && (
            <TutorialModal
              text={objective_tutorial_text}
              tutorialAct="proceede_objective_tutorial" />
          )}
          <Flex mb={1}>
            <Button
              width="85px"
              height="20px"
              icon="plus"
              content="Add Goal"
              textAlign="center"
              onClick={() => act('add_advanced_goal')} />
            { antag_type === "Heretic" && (
              <Button.Checkbox
                width="140px"
                height="20px"
                content="Toggle Ascending"
                textAlign="center"
                checked={heretic_data.can_ascend}
                tooltip="Toggle the ability to ascend. \
                        Disabling ascending rewards 3 bonus charges."
                onClick={() => act('toggle_ascension')} />)}
            { antag_type === "Heretic" && (
              <Button.Checkbox
                width="140px"
                height="20px"
                content="Toggle Sacrificing"
                textAlign="center"
                checked={heretic_data.can_sac}
                tooltip="Toggle the ability to sacrifice. \
                        Disabling sacrificing rewards 3 bonus charges."
                onClick={() => act('toggle_sacrificing')} />)}
            { goals_finalized === 0 && (
              <Button.Confirm
                width="112px"
                height="20px"
                icon="exclamation-circle"
                content="Finalize Goals"
                color="bad"
                textAlign="center"
                tooltip={finalize_text}
                onClick={() => act('finalize_goals')} />)}
          </Flex>
          { !!goals.length && (
            <AdvancedTraitorPanelGoals />
          )}
        </Section>
      </Window.Content>
    </Window>
  );
};

const TutorialModal = (props, context) => {
  const { act } = useBackend(context);

  return (
    <Modal>
      <Box
        mb={1}
        textAlign="center"
        preserveWhitespace >
        {props.text}
      </Box>
      <Box align="center">
        <Button
          textAlign="center"
          content="Procede"
          width="60px"
          onClick={() => act(props.tutorialAct)} />
      </Box>
    </Modal>
  );
};

export const AdvancedTraitorPanelBackground = (props, context) => {
  const { act, data } = useBackend(context);
  const {
    name,
    employer,
    backstory,
  } = data;
  return (
    <Flex>
      <Flex.Item width={30}>
        <Flex direction="column">
          <Flex.Item mb={1}>
            <Box mb={1}>
              Name:
            </Box>
            <Input
              width="250px"
              value={name}
              onInput={(e, value) => act('set_name', {
                name: value,
              })}
              placeholder={name} />
          </Flex.Item>
          <Flex.Item mb={1}>
            <Box mb={1}>Employer:</Box>
            <Input
              width="250px"
              value={employer}
              onInput={(e, value) => act('set_employer', {
                employer: value,
              })}
              placeholder={employer} />
          </Flex.Item>
        </Flex>
      </Flex.Item>
      <Flex.Item grow={1} mb={1}>
        <Box width="40px" mb={1}>Backstory:</Box>
        <TextArea
          fluid
          width="50%"
          height="100px"
          value={backstory}
          onInput={(e, value) => act('set_backstory', {
            backstory: value,
          })}
          placeholder={backstory} />
      </Flex.Item>
    </Flex>
  );
};

export const AdvancedTraitorPanelGoals = (props, context) => {
  const { act, data } = useBackend(context);
  const {
    goals = [],
  } = data;

  const [selectedGoalID, setSelectedGoal] = useSharedState(context, 'goals', goals[0]?.id);
  const selectedGoal = goals.find(goal => {
    return goal.id === selectedGoalID;
  });

  return (
    <Flex direction="column" grow={1}>
      { goals.length > 0 && (
        <Flex.Item>
          <Tabs>
            {goals.map(goal => (
              <Tabs.Tab
                key={goal.id}
                selected={goal.id === selectedGoalID}
                onClick={() => setSelectedGoal(goal.id)}>
                <Box>
                  Goal: {goal.id}
                  <Button
                    ml={2}
                    width="20px"
                    height="18px"
                    icon="minus"
                    color="bad"
                    textAlign="center"
                    onClick={() => act('remove_advanced_goal', { 'goal_ref': goal.ref })} />
                </Box>
              </Tabs.Tab>
            ))}
          </Tabs>
        </Flex.Item>
      )}
      { selectedGoal ? (
        <Flex.Item>
          <Flex direction="column">
            <Flex>
              <Flex direction="column" ml={2} mr={2} align="center" width="50%">
                <Flex.Item mb={2} >
                  Goal Text
                </Flex.Item>
                <Flex.Item width="100%">
                  <TextArea
                    fluid
                    width="100%"
                    height="100px"
                    value={selectedGoal.goal}
                    onInput={(e, value) => act('set_goal_text', {
                      'goal_ref': selectedGoal.ref,
                      newgoal: value,
                    })} />
                </Flex.Item>
              </Flex>
              <Flex direction="column" mr={2} align="center">
                <Flex.Item mb={2}>
                  Intensity
                </Flex.Item>
                <Flex.Item mb={2} position="relative">
                  <RoundGauge
                    size={2}
                    value={selectedGoal.intensity}
                    minValue={1}
                    maxValue={5}
                    alertAfter={3.9}
                    format={value => null}
                    ranges={{
                      "green": [1, 1.8],
                      "good": [1.8, 2.6],
                      "yellow": [2.6, 3.4],
                      "orange": [3.4, 4.2],
                      "red": [4.2, 5] }} />
                  <Tooltip
                    content="Set your goal's intensity level. Check the tutorial for what each level means." />
                </Flex.Item>
                <Flex.Item>
                  <NumberInput
                    value={selectedGoal.intensity}
                    step={1}
                    minValue={1}
                    maxValue={5}
                    stepPixelDrag={10}
                    onChange={(e, value) => act('set_goal_intensity', {
                      'goal_ref': selectedGoal.ref,
                      newlevel: value,
                    })} />
                </Flex.Item>
              </Flex>
              <Flex direction="column" mr={2} align="center">
                <Flex.Item mb={2}>
                  Additional Notes
                </Flex.Item>
                <Flex.Item>
                  <TextArea
                    width="200px"
                    height="100px"
                    value={selectedGoal.notes}
                    onInput={(e, value) => act('set_note_text', {
                      'goal_ref': selectedGoal.ref,
                      newtext: value,
                    })} />
                </Flex.Item>
              </Flex>
              <Flex direction="column" mr={2} align="center" width="100%">
                <Flex.Item mb={1}>
                  <Flex direction="column" >
                    <Flex.Item mb={2} align="center">
                      Similar Objectives
                    </Flex.Item>
                    <Flex.Item align="center">
                      <Button.Checkbox
                        content="Check All"
                        width="85px"
                        height="20px"
                        tooltip={selectedGoal.check_all_objectives ? ("Currently, success is determined on all objectives succeeding.") : ("Currently, success is determined on any one of the objectives succeeding.")}
                        checked={selectedGoal.check_all_objectives}
                        onClick={() => act('toggle_check_all_objectives', { 'goal_ref': selectedGoal.ref })} />
                      <Button.Checkbox
                        content="Always Succeed"
                        width="130px"
                        height="20px"
                        tooltip={selectedGoal.always_succeed ? ("Currently, this objective will always be marked as a success, even if no objectives are set.") : ("Currently, success of this objective will depend on success of the objectives below. If no objectives are set, no success or failure text will be displayed at all.")}
                        checked={selectedGoal.always_succeed}
                        onClick={() => act('toggle_always_succeed', { 'goal_ref': selectedGoal.ref })} />
                    </Flex.Item>
                  </Flex>
                </Flex.Item>
                <Flex.Item>
                  <Button
                    width="160px"
                    height="20px"
                    icon="plus"
                    content="Add Similar Objective"
                    textAlign="center"
                    onClick={() => act('add_similar_objective', { 'goal_ref': selectedGoal.ref })} />
                  <Button.Confirm
                    width="210px"
                    height="20px"
                    icon="minus"
                    content="Remove All Similar Objectives"
                    disabled={!selectedGoal.objective_data.length}
                    color="bad"
                    textAlign="center"
                    onClick={() => act('clear_sim_objectives', { 'goal_ref': selectedGoal.ref })} />
                </Flex.Item>
                <Flex.Item width="90%">
                  <Flex direction="column" width="100%">
                    {selectedGoal.objective_data.map(objective => (
                      <Flex.Item key={objective.trimmed_text}>
                        <Flex>
                          <Button
                            content="Remove Objective"
                            color="bad"
                            onClick={() => act('remove_similar_objective', { 'goal_ref': selectedGoal.ref, 'objective_ref': objective.ref })} />
                          <Box position="relative">
                            : {objective.trimmed_text}
                            <Tooltip content={objective.text} />
                          </Box>
                        </Flex>
                      </Flex.Item>))}
                  </Flex>
                </Flex.Item>
              </Flex>
            </Flex>
          </Flex>
        </Flex.Item>
      ) : (
        <Flex.Item>
          No goals selected.
        </Flex.Item>
      )}
    </Flex>
  );
};
