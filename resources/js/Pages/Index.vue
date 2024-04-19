<template>
    <div class="custom-container">
    <div class="left-column">
    </div>
    <div class="right-column">
        <div class="justify-content-center ">
            <div class="card flex justify-content-center">
                <h1 >Editar [Designação da Escola]</h1>
                <DataTable class="custom-datatable"

                    :value="laboratorios"
                    showGridlines
                    tableStyle="min-width: 50rem"

                >
                    <template #header>
                        <div style="text-align: right">
                            <Button
                            class="custom-button"
                                label="Adicionar Laboratorio"
                                @click="visible = true"
                            />
                        </div>
                    </template>
                    <Column field="designacao" header="Designação" :headerStyle="{ backgroundColor: '#C4C4C4' } " style="background-color: #EAEAEA; border: 1px solid #A0A0AA;" ></Column>
                    <Column field="funciona" header="Funcionais" :headerStyle="{ backgroundColor: '#C4C4C4' }" style="background-color: #EAEAEA; border: 1px solid #A0A0AA;">
                        <template #body="slotProps">
                            <InputNumber
                                :disabled="
                                    slotProps.data.funciona == 0 &&
                                    slotProps.data.nao_funciona == 0
                                "
                                v-model="slotProps.data.funciona"
                                inputId="minmax-buttons"
                                mode="decimal"
                                showButtons
                                :min="0"
                                :max="100"
                            />
                            <!--  <InputNumber for="integeronly" v-model="rowData.name" inputId="integeronly" /> -->
                        </template>
                    </Column>

                    <Column field="designacao" header="Não funcionais" :headerStyle="{ backgroundColor: '#C4C4C4' }" style="background-color: #EAEAEA; border: 1px solid #A0A0AA;">
                        <template #body="slotProps">
                            <InputNumber
                                :disabled="
                                    slotProps.data.funciona == 0 &&
                                    slotProps.data.nao_funciona == 0
                                "
                                v-model="slotProps.data.nao_funciona"
                                inputId="minmax-buttons"
                                mode="decimal"
                                showButtons
                                :min="0"
                                :max="100"
                            />
                            <!-- <InputNumber for="integeronly"  v-model="rowData.code" inputId="integeronly" /> -->
                        </template>
                    </Column>
                    <Column field="designacao" header="Número total" :headerStyle="{ backgroundColor: '#C4C4C4' }" style="background-color: #EAEAEA; border: 1px solid #A0A0AA;">
                        <template #body="slotProps">
                            <InputNumber
                                v-model="slotProps.data.total"
                                inputId="minmax-buttons"
                                mode="decimal"
                                showButtons
                                :min="slotProps.data.total"
                                :max="slotProps.data.total"
                            />
                            <!-- <InputNumber for="integeronly"  v-model="rowData.code" inputId="integeronly" /> -->
                        </template>
                    </Column>
                </DataTable>
                <div class="card" style="text-align: right; margin-top: 10px; ">
                    <Button
                    class="custom-button"
                        label="Atualizar"
                        @click="actualizarLaboratotio()"
                    ></Button>
                </div>
            </div>
        </div>
    </div>
  </div>
 <Dialog
            v-model:visible="visible"
            header="Cadastrar Salas"
            :style="{ width: '25rem' }"
        >
            <div class="card flex justify-content-center">
                <div class="flex flex-column gap-3">
                    <InputText
                        :style="{ width: '20rem' }"
                        v-model="designacao"
                        autocomplete="on"
                        placeholder="Descrição do campo da sala"
                    /><br />
                    <small v-if="vazio">Campo Obrigatório</small>
                </div>
                <div class=" flex-centro flex-column gap-3">
                    <InputNumber
                        :style="{ width: '20rem' }"
                        v-model="funciona"
                        autocomplete="on"
                        :min="0"
                            :max="100"
                        placeholder="Sala funcional"
                    /><br />

                </div>
                <div class="flex flex-column gap-3">
                    <InputNumber
                        :style="{ width: '20rem' }"
                        v-model="nao_funciona"
                        autocomplete="on"
                        :min="0"
                                :max="100"
                        placeholder="Sala nao funcional"
                    /><br />

                </div>

            </div>

            <div class="flex justify-content-end gap-3">
                <Button
                    class="p-mr-2"
                    type="button"
                    label="Cancelar"
                    severity="secondary"
                    @click="visible = false"
                ></Button>
                <Button
                    class="p-mr-2 custom-button"
                    type="button"
                    label="Salvar"
                    @click="adicionarLaboratotio()"
                ></Button>
            </div>
        </Dialog>

    <Toast />
</template>

<script setup>
import { useToast } from "primevue/usetoast";
import { ref } from "vue";
const toast = useToast();
const props = defineProps({
    laboratorios: Array,
});
let visible = ref(false);
let vazio = ref(false);
let laboratorio = ref(null);

let products = [];
products = [
    { code: "ABC123", name: 2012, funcionais: 0 },
    { code: "DEF456", name: 2014, funcionais: 0 },
    { code: "GHI789", name: 2018, funcionais: 0 },
];
const designacao = ref(null);

const funciona = ref(0);
const nao_funciona = ref(0);
const value2 = ref(0);
import { router } from "@inertiajs/vue3";
const adicionarLaboratotio = () => {
    //  alert(JSON.stringify(designacao))
    if (designacao.value) {
        router.post("/criar_laboratorio", {
            designacao: designacao.value,
            funciona: funciona.value,
            nao_funciona: nao_funciona.value,
        });
        toast.add({
        severity: "success",
        summary: "Successful",
        detail: "Cadastrado com sucesso",
        life: 3000,
    });
        visible.value = false;
        designacao.value =""
        nao_funciona.value =0
        funciona.value =0
    } else {
        vazio.value = true;
        toast.add({
        severity: "error",
        summary: "error",
        detail: "Campo Obrigatório",
        life: 3000,
    });
    }
};

const actualizarLaboratotio = () => {
    router.post("/editar_laboratorio", {
        laboratorio: props.laboratorios,
    });
    toast.add({
        severity: "success",
        summary: "Successful",
        detail: "Atualizado com sucesso",
        life: 3000,
    });
};
</script>
<style scoped>
.flex-centro{
    margin-top: 2px;
    margin-bottom: 2px;
}
.p-mr-2 {
    margin: 9px;
}
.lagura {
    width: 500px;
}
.body {
    margin: 0;
    padding: 0;
    box-sizing: 0;
    background-color: #ecebeb; /* Cinza claro */
}
.ccontainer {
    display: flex;
    justify-content: center;
    /*  align-items: center; */
    width: 100%;
    /* height: 100vh; */
}
.custom-container {
  display: flex;
  margin: 0;
    padding: 0;
    box-sizing: 0;
}

.left-column {
width: 100px;
  background-color: #999; /* Cor de fundo cinza */
  margin-right: 100px !important; /* Margem lateral direita de 20px */
  flex-grow: 1; /* Aumenta para preencher o espaço restante */
}

.right-column {
    margin-right: 90px;
    margin-top: 50px;
  flex-grow: 1; /* Aumenta para preencher o espaço restante */

}
.custom-datatable .p-datatable-tbody td:nth-child(1) {
  background-color: #583d3d; /* Cor de fundo da primeira coluna */
}
.custom-button {
    background-color: #2B6AB5;
    color: white;
width: 150px;
border: none;
}
</style>
