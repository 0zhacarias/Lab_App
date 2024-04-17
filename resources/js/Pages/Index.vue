<template>
    <div class="card flex justify-content-center">

        <Dialog
            v-model:visible="visible"
            header="Cadastrar Salas"
            :style="{ width: '30rem' }"
        >
            <div class="flex align-items-center gap-3 mb-3">
                <label for="username" class="font-semibold w-6rem"
                    >Designacao do Laboratório</label
                >
                <InputText id="username" class="flex-auto" autocomplete="off"  v-model="designacao"/>
                <small v-if="vazio" id="username-help">Campo Obrigatório.</small>
            </div>
           <!--  <div class="flex align-items-center gap-3 mb-5">
                <label for="email" class="font-semibold w-6rem">Email</label>
                <InputText id="email" class="flex-auto" autocomplete="off" />
            </div> -->
            <div class="flex justify-content-end gap-2">
                <Button
                    type="button"
                    label="Cancelar"
                    severity="secondary"
                    @click="visible = false"
                ></Button>
                <Button
                    type="button"
                    label="Salvar"
                    @click="adicionarLaboratotio()"
                ></Button>
            </div>
        </Dialog>
    </div>
    <div class="card">

        <div class="card flex justify-content-center"></div>
        <DataTable
            :value="laboratorios"
            showGridlines
            tableStyle="min-width: 50rem"
        >
            <template #header>
                <div style="text-align: right">
                    <Button label="Adicionar Laboratorio" @click="visible = true" />
                </div>
            </template>
            <Column field="designacao" header="Designação"></Column>
            <Column field="designacao" header="Funcionais">
                <template #body="rowData">
                    <InputNumber
                        v-model="value2"
                        inputId="minmax-buttons"
                        mode="decimal"
                        showButtons
                        :min="0"
                        :max="100"
                    />
                    <!--  <InputNumber for="integeronly" v-model="rowData.name" inputId="integeronly" /> -->
                </template>
            </Column>

            <Column field="designacao" header="Não funcionais">
                <template #body="rowData">
                    <InputNumber
                        v-model="rowData.code"
                        inputId="minmax-buttons"
                        mode="decimal"
                        showButtons
                        :min="0"
                        :max="100"
                    />
                    <!-- <InputNumber for="integeronly"  v-model="rowData.code" inputId="integeronly" /> -->
                </template>
            </Column>
            <Column field="designacao" header="Numero tota,">
                <template #body="rowData">
                    <InputNumber
                        v-model="rowData.code"
                        inputId="minmax-buttons"
                        mode="decimal"
                        showButtons
                        :min="0"
                        :max="100"
                    />
                    <!-- <InputNumber for="integeronly"  v-model="rowData.code" inputId="integeronly" /> -->
                </template>
            </Column>

        </DataTable>

    <div class="card flex justify-content-center">
        <Button label="Atualizar"   @click="actualizarLaboratotio()" ></Button>
    </div>

    </div>
</template>

<script setup>
import { ref } from "vue";
const props = defineProps({
    laboratorios: Array,
});
const visible = ref(false);
let vazio =ref(false);
let products = [];
products = [
    { code: "ABC123", name: 2012, funcionais: 0 },
    { code: "DEF456", name: 2014, funcionais: 0 },
    { code: "GHI789", name: 2018, funcionais: 0 },
];
const designacao = ref(null);

const value2 = ref(0);
import { router } from '@inertiajs/vue3'
const adicionarLaboratotio = () => {
  //  alert(JSON.stringify(designacao))
  if(designacao.value){
    router.post("/criar_laboratorio", {
        designacao:designacao.value
    })
    visible = false
  }else{

    vazio.value = true;
  }

};
const actualizarLaboratotio = () =>{
    alert(JSON.stringify(laboratorios))
    router.post("/criar_laboratorio", {
        designacao:designacao.value
    })
  }
</script>
<!--
<template>
    <div class="card">
        <div class="card flex justify-content-center">

    </div>
        <DataTable :value="products" showGridlines tableStyle="min-width: 50rem">
            <template #header>
        <div style="text-align: left">
            <Button icon="pi pi-add" label="Export" @click="exportCSV($event)" />
        </div>
    </template>
            <Column field="code" header="Code"></Column>
            <Column field="name" header="Name"></Column>
            <Column field="category" header="Category"></Column>

        </DataTable>
    </div>
</template>

<script setup>


const visible = ref(false);
    let products = [];
 products = [
      { code: 'ABC123', name: 2012, category: 'Toyota',  },
      { code: 'DEF456', name: 2014, category: 'Ford',  },
      { code: 'GHI789', name: 2018, category: 'Audi',  }
    ];


</script>
 -->
