Return-Path: <linux-doc+bounces-20156-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A7B92950B
	for <lists+linux-doc@lfdr.de>; Sat,  6 Jul 2024 21:00:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D6081F2152B
	for <lists+linux-doc@lfdr.de>; Sat,  6 Jul 2024 19:00:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A07074040;
	Sat,  6 Jul 2024 19:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gswVxviI"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E321367;
	Sat,  6 Jul 2024 19:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720292428; cv=none; b=in8eAwhmfbGhzBfzQBwfWCWNLLNk2yVYEQz0JOdJ+3I8GHqZcNJ5/7A0YuNsWqj+tZDDKHlsKMq0RpaxlvToUqcrr3YOsLEDZq74MYVbPZ98LDmkYVVhMEl0uGD0OfiH047uS1y2rWuyFoolww3E27k7ifiLyCcWbBuvcDvnQ4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720292428; c=relaxed/simple;
	bh=S5QXXV4/LKFkUhGE/EpkvRsdGr/xK4gr/6Exz46x+H4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hWiPfmJQsi57asn5vFBmPkpRvYEe3LufLESGwiDgTrg9phfTw2C9AvPAsxhvvSbNy1HgHshkvIxA3moj5z+vss/jKYf4nmpryP83VuiMQhOv8ieeMeAnQBp3sVQeafi+TfUEGXEkubMCu89pq+19sYf6GyV7cCxKBitJxFpo3jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gswVxviI; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3d928b2843dso233971b6e.2;
        Sat, 06 Jul 2024 12:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720292425; x=1720897225; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BxuCxi7n1lDJATIZv8v0peNVsdEkdq6s2sZWH0M134Q=;
        b=gswVxviIF61184sAYGj0pvEEzhKiFaQXm3TJbzFLe9uVYMVM17tMfy1RJjsJHo06wC
         X0WzRj4FY5UQniWK/pBQcR0u7Ajac4HIT4WQ6h4E2xTLF3FmBaqcRycLeldR/kAZSqCl
         CQCUtZ7c5ppcFXDY/L3JqoJBT5p/xjB6PAkJp8e4fmeJOn4E5/AfSBqNPZneSzYpnprP
         a7ElTdqQWpBMUo+VD8WJzN9sWjJIoIu89EfciwzS59u8NtXNuA2aVGQR8sLp5xsk/GxH
         x1vp8b65pZcch0tdr96+A8b5HtcaQep85uurGVH3cxBPCbADwkzdVYsjVh76eRCbvCIZ
         RaNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720292425; x=1720897225;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BxuCxi7n1lDJATIZv8v0peNVsdEkdq6s2sZWH0M134Q=;
        b=F3RDYCy9D3yMrJKivM8LFQR1BOOhnYqnrD9IGk/H9MTyDPMda2hShjEAo3zs/9uSbb
         3e2C87a/SR3QF20c5E64xS9aeRzbg5vVWqE4UCthg/WETMO4/9dEV9Y51e55ua/SpF5V
         Jcwvi8yjTCpXGKN2EVWNJHDRVEqmTNOZNHQ2DV2YA40I2r5I0FTpLa5OSlqqFa1J5ZZM
         z9AaCl369MuEBcTaJ++Qs41BQ9rLO7AtEjjzA3aV7OJC1RAa0QFpm9hwi6cEsve6FQNm
         Vm8Gqvih2jtI51J+hnw5GtPaX0xjN6SUxL2LsFnOrytWsL30XgE/1bRtKRmBb2VpFxfZ
         qT9A==
X-Forwarded-Encrypted: i=1; AJvYcCXHZuWq+JXLsrFdR8seoeWoNiErz4jja3fPjIoBApHxFUCUucwlySjsBLa3bpw8O1pVNkOqTxyWJlAzremCv1jFo1QhbOR/jDmiR3TW
X-Gm-Message-State: AOJu0YwREFUtnz+Tmoxrkbmo68TNni/KL8dFKKJVK2XfTpWJxi/BEedo
	UkZWjWY4A7yT1sX3/Boyz2anxBiMV+FDjvFWn7NUXudP7fEIkJcN
X-Google-Smtp-Source: AGHT+IFPUpRYQ/Quvl7Ev/ZyzBs1tWL4HhyoN1VTpkGCs/6EkO9mYj14Nx5VL2x8zrNhzoNqHQovfw==
X-Received: by 2002:a05:6808:1920:b0:3d9:26d6:c6f3 with SMTP id 5614622812f47-3d926d77f6cmr2500440b6e.11.1720292425265;
        Sat, 06 Jul 2024 12:00:25 -0700 (PDT)
Received: from ?IPV6:2600:1700:f0:4240::14? ([2600:1700:f0:4240::14])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3d62fb48ab1sm3072723b6e.54.2024.07.06.12.00.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Jul 2024 12:00:24 -0700 (PDT)
Message-ID: <375dbc3c-e741-4bdb-88ff-35e68d43c36d@gmail.com>
Date: Sat, 6 Jul 2024 14:00:21 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/sp_SP: Add translation for
 scheduler/sched-design-CFS.rst
To: =?UTF-8?Q?Sergio_Gonz=C3=A1lez_Collado?= <sergio.collado@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, Ingo Molnar <mingo@kernel.org>,
 Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>,
 Shrikanth Hegde <sshegde@linux.vnet.ibm.com>,
 Wenyu Huang <huangwenyu5@huawei.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, bilbao@vt.edu
References: <20240706132201.26136-1-sergio.collado@gmail.com>
Content-Language: en-US
From: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
In-Reply-To: <20240706132201.26136-1-sergio.collado@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

On 7/6/24 08:22, Sergio González Collado wrote:
> Translate Documentation/scheduler/sched-design-CFS.rst into Spanish
>
> Signed-off-by: Sergio González Collado <sergio.collado@gmail.com>
> ---
>  Documentation/scheduler/sched-design-CFS.rst  |   2 +
>  Documentation/translations/sp_SP/index.rst    |   1 +
>  .../translations/sp_SP/scheduler/index.rst    |   8 +
>  .../sp_SP/scheduler/sched-design-CFS.rst      | 275 ++++++++++++++++++
>  4 files changed, 286 insertions(+)
>  create mode 100644 Documentation/translations/sp_SP/scheduler/index.rst
>  create mode 100644 Documentation/translations/sp_SP/scheduler/sched-design-CFS.rst
>
> diff --git a/Documentation/scheduler/sched-design-CFS.rst b/Documentation/scheduler/sched-design-CFS.rst
> index e030876fbd68..bc1e507269c6 100644
> --- a/Documentation/scheduler/sched-design-CFS.rst
> +++ b/Documentation/scheduler/sched-design-CFS.rst
> @@ -1,3 +1,5 @@
> +.. _sched_design_CFS:
> +
>  =============
>  CFS Scheduler
>  =============
> diff --git a/Documentation/translations/sp_SP/index.rst b/Documentation/translations/sp_SP/index.rst
> index 274ef4ad96b9..aae7018b0d1a 100644
> --- a/Documentation/translations/sp_SP/index.rst
> +++ b/Documentation/translations/sp_SP/index.rst
> @@ -78,3 +78,4 @@ Traducciones al español
>  
>     process/index
>     wrappers/memory-barriers
> +   scheduler/index
> diff --git a/Documentation/translations/sp_SP/scheduler/index.rst b/Documentation/translations/sp_SP/scheduler/index.rst
> new file mode 100644
> index 000000000000..768488d6f001
> --- /dev/null
> +++ b/Documentation/translations/sp_SP/scheduler/index.rst
> @@ -0,0 +1,8 @@
> +.. include:: ../disclaimer-sp.rst
> +
> +.. _sp_scheduler_index:
> +
> +.. toctree::
> +    :maxdepth: 1
> +
> +    sched-design-CFS
> diff --git a/Documentation/translations/sp_SP/scheduler/sched-design-CFS.rst b/Documentation/translations/sp_SP/scheduler/sched-design-CFS.rst
> new file mode 100644
> index 000000000000..43e29297d7fa
> --- /dev/null
> +++ b/Documentation/translations/sp_SP/scheduler/sched-design-CFS.rst
> @@ -0,0 +1,275 @@
> +.. include:: ../disclaimer-sp.rst
> +
> +:Original: :ref:`Documentation/scheduler/sched-design-CFS.rst <sched_design_CFS>`
> +:Translator: Sergio González Collado <sergio.collado@gmail.com>
> +
> +.. _sp_sched_desing_CFS:
> +
> +====================
> +Gestor de tareas CFS
> +====================
> +
> +1.  VISIÓN GENERAL
> +==================
> +
> +CFS viene de las siglas en inglés de "Gestor te tareas totalmente justo"


Change 'te' to 'de'. For the rest of the review, I'll say instead:
's/old/new', in this case, s/te/de.


> +("Completely Fair Scheduler"), y es el nuevo gestor de tareas de escritorio
> +implementado por Ingo Molnar e integrado en Linux 2.6.23. Es el sustituto de
> +el previo gestor de tareas SCHED_OTHER.


Although I usually don't do this, considering that CFS is no longer the
most recent scheduler, let's add a note here:

Nota: El planificador EEVDF fue incorporado más recientemente al kernel.


> +
> +El 80% del diseño de CFS puede ser resumido en una única frase: CFS
> +básicamente modela una "CPU ideal, precisa y multi-tarea" sobre hardware
> +real.
> +
> +"una CPU multitarea ideal" es una CPU (inexistente :-)) que tiene un 100%
> +de potencia y que puede ejecutar cualquier tarea exactamente a la misma
> +velocidad, en paralelo, y cada una a 1/n velocidad. Por ejemplo, si hay dos
> +tareas ejecutándose, entonces cada una usa un 50% de la potencia --- es decir,
> +como si se ejecutaran en paralelo.
> +
> +En un hardware real, se puede ejecutar una única tarea a la vez, así que


s/En un hardware/En hardware


> +se ha usado el concepto de "tiempo de ejecución virtual". El tiempo
> +de ejecución virtual de una tarea, específica cuando la siguiente porción


s/tarea,/tarea


> +de ejecución podría empezar en la CPU ideal multi-tarea descrita anteriormente.
> +En la práctica, el tiempo de ejecución virtual de una tarea es el
> +tiempo de ejecución real normalizado con respecto al número total de
> +tareas ejecutándose.
> +
> +
> +2.  UNOS CUANTOS DETALLES DE IMPLEMENTACIÓN
> +===========================================
> +
> +En CFS, el tiempo de ejecución virtual se expresa y se monitoriza por
> +cada tarea, en su valor de p->se.vruntime (en unidades de nanosegundos).
> +De este modo, es posible temporizar con precisión y medir el "tiempo
> +de CPU esperado" que una tarea debería tener.
> +
> +Un pequeño detalle: en hardware "ideal", en cualquier momento todas las
> +tareas pueden tener el mismo valor de p->se.vruntime --- i.e., tareas
> +se podrían ejecutar simultáneamente y ninguna tarea podría escaparse del
> +"balance" de la partición "ideal" del tiempo compartido de la CPU.
> +
> +La lógica de elección del tareas de CFS se basa en el valor de p->se.vruntime
> +y por tanto es muy sencilla: siempre intenta ejecutar la tarea con el valor
> +p->se.vruntime más pequeño (i.e., la tarea que se ha ejecutado menos hasta el
> +momento). CFS siempre intenta dividir el espacio de tiempo entre tareas
> +en ejecución tan próximo a la "ejecución multitarea ideal del hardware" como
> +sea posible.
> +
> +El resto del diseño de CFS simplemente se escapa de este simple concepto,
> +con unos cuantos añadidos como los niveles "nice" ("nice" significa "amable"
> +en inglés), multi-tarea y varias variantes del algoritmo para identificar
> +tareas "durmiendo".
> +
> +
> +3.  EL ÁRBOL ROJO-NEGRO
> +=======================
> +
> +El diseño de CFS es bastante radical: no utiliza las antiguas estructuras
> +de datos para las colas de ejecución (en inglés "runqueues"), pero usa una
> +estructura de árbol rojo-negro (en inglés "red-black tree") ordenado cronológicamente
> +para construir un línea de ejecución en el futuro, y por eso no tiene ningún
> +artificio de "cambio de tareas" (algo que previamente era usado por el gestor
> +anterior y RSDL/SD).
> +
> +CFS también mantiene el valor de rq->cfs.min_vruntime, el cual crece
> +monotónicamente siguiendo el valor más pequeño de vruntime de entre todas
> +las tareas en la cola de ejecución. La cantidad total de trabajo realizado
> +por el sistema es monitorizado usado min_vruntime; este valor es usado
> +para situar las nuevas tareas en la parte izquierda del árbol tanto
> +como sea posible.
> +
> +El valor total de tareas ejecutándose en la cola de ejecución es
> +contabilizado mediante el valor rq->cfs.load, el cual es la suma de los
> +de esas tareas que están en la cola de ejecución.
> +
> +CFS mantiene un árbol rojo-negro cronológiamente ordenado, donde todas las


s/cronológiamente/cronológicamente


> +tareas que pueden ser ejecutadas están ordenadas por su valor de
> +p->se.vruntime. CFS selecciona la tarea más hacia la izquierda de este
> +árbol y la mantiene. Según el sistema continúa, las tareas ejecutadas
> +se ponen en este árbol más y más hacia la derecha --- lentamente pero
> +de forma continuada dando una oportunidad a cada tarea de ser la que
> +está "la más hacia la izquierda" y por tanto obtener la CPU una cantidad
> +determinista de tiempo.
> +
> +Resumiendo, CFS funciona así: ejecuta una tarea un tiempo, y cuando la
> +tarea se gestiona (o sucede un tic del gestor de tareas) se considera
> +que el tiempo de uso de la CPU se ha completado, y se añade a
> +p->se.vruntime. Una vez p->se.vruntime ha aumentado lo suficiente como
> +para que otra tarea sea "la tarea más hacia la izquierda" del árbol
> +rojo-negro ordenado cronológicamente esta mantienen (más una cierta pequeña
> +cantidad de distancia relativa a la tarea más hacia la izquierda para
> +que no se sobre-reserven tareas y perjudique a la cache), entonces la
> +nueva tarea "que está a la izquierda del todo", es la que se elige
> +para que se ejecute, y la tarea en ejecución es interrumpida.
> +
> +4.  ALGUNAS CARACTERÍSTICAS DE CFS
> +==================================
> +
> +CFS usa una granularidad de nanosegundos y no depende de ningún
> +jiffie o detalles como HZ. De este modo el gestor de tareas CFS no tiene


s/modo/modo,


> +noción de "ventanas de tiempo" de la forma en que tenía el gestor de
> +tareas previo, y tampoco tiene heurísticos. Únicamente hay un parámetro
> +central ajustable (se ha de cambiar en CONFIG_SCHED_DEBUG):
> +
> +   /sys/kernel/debug/sched/base_slice_ns
> +
> +El cual puede ser usado para afinar desde el gestor de tareas del "escritorio"
> +(i.e., bajas latencias) hacia cargas de "servidor" (i.e., bueno con
> +procesamientos). Su valor por defecto es adecuado para tareas de escritorio.
> +SCHED_BATCH también es gestionado por el gestor de tareas CFS.
> +
> +Debido a su diseño, el gestor de tareas CFS no es proclive a ninguno de los
> +ataques que existen a día de hoy contra los heurísticos del gestor de tareas:
> +fiftyp.c, thud.c, chew.c, ring-test.c, massive_intr.c todos trabajan
> +correctamente y no tienen impacto en la interacción y se comportan de la forma
> +esperada.
> +
> +El gestor de tareas CFS tiene una gestión mucho más firme de los niveles
> +"nice" y SCHED_BATCH que los previos gestores de tareas: ambos tipos de
> +tareas están aisladas de forma más eficiente.
> +
> +El balanceo de tareas SMP ha sido rehecho/mejorado: el avance por las
> +colas de ejecución de tareas ha desaparecido del código de balanceo de
> +carga, y ahora se usan iteradores en la gestión de módulos. El balanceo
> +del código ha sido simplificado como resultado esto.
> +
> +5.  Políticas de gestión de tareas
> +==================================
> +
> +CFS implementa tres políticas de gestión de tareas:
> +
> +  - SCHED_NORMAL (tradicionalmente llamada SCHED_OTHER): Gestión de
> +    tareas que se usan para tareas normales.
> +
> +  - SCHED_BATCH: No interrumpe tareas tan amenudo como las tareas


s/amenudo/a menudo


> +    normales harían, por eso permite a las tareas ejecutarse durante
> +    ventanas de tiempo mayores y hace un uso más efectivo de las
> +    caches pero al coste de la interactividad. Esto es adecuado
> +    para trabajos de procesado de datos.
> +
> +  - SCHED_IDLE: Esta política es más débil incluso que nice 19, pero
> +    no es un gestor "idle" para evitar caer en el problema de la
> +    inversión de prioridades que causaría un bloqueo de la máquina
> +    (deadlock).
> +
> +SCHED_FIFO/_RR se implementan en sched/rt.c y son específicos de
> +POSIX.
> +
> +El comando chrt de util-linux-ng 2.13.1.1. puede asignar cualquiera de
> +estas políticas excepto SCHED_IDLE.
> +
> +
> +6.  CLASES DE GESTIÓN
> +=====================
> +
> +El nuevo gestor de tareas CFS ha sido diseñado de tal modo para incluir
> +"clases de gestión", una jerarquía ampliable de módulos que pueden tener
> +distintas políticas de gestión de tareas. Estos módulos encapsulan los
> +detalles de las politicas de gestion y son manejadas por el núcleo del


s/gestion/gestión


> +gestor de tareas sin que este tenga que presuponer mucho sobre estas clases.
> +
> +sched/fair.c implementa el gestor de tareas CFS descrito arriba.


s/arriba/antes


> +
> +sched/rt.c implementa la semántica de SCHED_FIFO y SCHED_RR, de una forma
> +más sencilla que el gestor de tareas anterior. Usa 100 colas de ejecución
> +(por todos los 100 niveles de prioridad RT, en vez de las 140 que necesitaba
> +el gestor de tareas anterior) y no necesita las listas de expiración.
> +
> +Las clases de gestión de tareas son implementadas por medio de la estructura
> +sched_class, la cual tiene llamadas a las funciones que deben de llamarse
> +cuando quiera que ocurra un evento interesante.
> +
> +Esta es la lista parcial de llamadas:
> +
> + - enqueue_task(...)
> +
> +   Llamada cuando una tarea entra en el estado de lista para ejecución.
> +   Pone la entidad a ser gestionada (la tarea) en el árbol rojo-negro
> +   e incrementa la variable nr_running.
> +
> + - dequeue_task(...)
> +
> +   Cuando una tarea deja de ser ejecutable, esta función se llama para
> +   mantener a la entidad gestionada fuera del árbol rojo-negor. Esto
> +   decrementa la variable nr_running.
> +
> + - yield_task(...)
> +
> +   Esta función es básicamente desencolar, seguido por encolar, a menos que
> +   sysctl compat_yield esté activado; en ese caso, sitúa la entidad a gestionar
> +   en la parte más hacia la derecha del árbol rojo-negro.
> +
> + - check_preempt_curr(...)
> +
> +   Esta función comprueba si una tarea que ha entrado en el estado de
> +   poder ser ejecutada, podría reemplazar a la tarea que actualmente
> +   se esté ejecutando.
> +
> + - pick_next_task(...)
> +
> +   Esta función elige la tarea más apropiada para ser ejecutada a continuación.
> +
> + - set_curr_task(...)
> +
> +   Esta función se llama cuando una tarea cambia su clase de gestión o
> +   cambia su grupo de tareas.
> +
> + - task_tick(...)
> +
> +   Esta función es llamada la mayoría de las veces desde la función de tiempo
> +   tick; esto puede llevar a un cambio de procesos. Esto dirige el reemplazo
> +   de las tareas.
> +
> +
> +7.  EXTENSIONES DE GRUPOS PARA CFS
> +==================================
> +
> +Normalmente, el gestor de tareas gestiona tareas individuales e intenta
> +proporcionar una cantidad justa de CPU a cada tarea. Algunas veces, puede
> +ser deseable agrupar las tareas y proporcionarles una cantidad justa
> +de tiempo de CPU a cada una de las tareas de ese grupo. Por ejemplo,
> +podría ser deseable que primero se proporcione una cantidad justa de
> +tiempo de CPU a cada usuario del sistema y después a cada tarea
> +que pertenezca a un usuario.
> +
> +CONFIG_CGROUP_SCHED destaca en conseguir exactamente eso. Permite a las
> +tareas ser agrupadas y divide el tiempo de CPU de forma just entre esos
> +grupos.
> +
> +CONFIG_RT_GROUP_SCHED permite agrupar tareas de tiempo real (i.e.,
> +SCHED_FIFO y SCHED_RR).
> +
> +CONFIG_FAIR_GROUP_SCHED permite agrupar tareas de CFS (i.e., SCHED_NORMAL y
> +SCHED_BATCH).
> +
> +Estas opciones necesitan CONFIG_CGROUPS para ser definidas, y permitir
> +al administrador crear grupos arbitrarios de tareas, usando el pseudo
> +sistema de archivos "cgroup". Vease la documentación para más información
> +sobre este sistema de archivos: Documentation/admin-guide/cgroup-v1/cgroups.rst
> +
> +Cuando CONFIG_FAIR_GROUP_SCHED es definido, un archivo
> +"cpu.shares" es creado por cada grupo creado usado en el pseudo
> +sistema de archivos. Véanse por ejemplo los pasos a continuación
> +para crear grupos de tareas y modificar cuanto comparten de la CPU
> +usando el pseudo sistema de archivos "cgroup" ::
> +
> +	# mount -t tmpfs cgroup_root /sys/fs/cgroup
> +	# mkdir /sys/fs/cgroup/cpu
> +	# mount -t cgroup -ocpu none /sys/fs/cgroup/cpu
> +	# cd /sys/fs/cgroup/cpu
> +
> +	# mkdir multimedia	# crear un grupo de tareas "multimedia"
> +	# mkdir browser 	# crear un grupo de tareas "browser"
> +
> +	# #Configurar el grupo multimedia para tener el doble de tiempo de CPU
> +	# #que el grupo browser
> +
> +	# echo 2048 > multimedia/cpu.shares
> +	# echo 1024 > browser/cpu.shares
> +
> +	# firefox &	# Lanzar firefox y moverlo al grupo "browser"
> +	# echo <firefox_pid> > browser/tasks
> +
> +	# #Lanzar gmplayer (o su programa favorito de reproducción de películas)
> +	# echo <movie_player_pid> > multimedia/tasks


Sergio, thank you for contributing to the documentation in Spanish. This is
excellent work! Please, send a v2 with these minor changes, and you can
add:
Reviewed-by: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
Thanks,
Carlos


