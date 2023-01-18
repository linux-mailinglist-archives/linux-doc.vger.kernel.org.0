Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB0A9672434
	for <lists+linux-doc@lfdr.de>; Wed, 18 Jan 2023 17:54:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229941AbjARQyV (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 18 Jan 2023 11:54:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229774AbjARQyT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 18 Jan 2023 11:54:19 -0500
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0782016AE9;
        Wed, 18 Jan 2023 08:54:18 -0800 (PST)
Received: by mail-ot1-x331.google.com with SMTP id d6-20020a056830138600b0068585c52f86so5365936otq.4;
        Wed, 18 Jan 2023 08:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=trkPot4D4P6KfsYOzQpqmpa9FQAxVtvOC6vh58MIUmU=;
        b=lj7tslLDqLyezE7LxSfOrjqsf/PHkb347CazNXAiCytxNt/qypVB92Z2A4tXKj+H7m
         Xyhbos2xUaM5DvR0TcLp5T02Zvjd5bqc7f5flhH0o2Lr3yeU5hYvMxffs79Y+uHJi26x
         EsTyNpf2KT0juBaW0ucXqlB7Pda3DhvEnh09HaPRIFqWgip6vd/8GLQ2YbOrEch9V5zo
         uMOZWN4ns5M6yCfX5g5LHleCwfInou2w+lvkyx2JTj5kp3MLfNCcm8EVWJYeznII3i0J
         JOJvdE0jC6rfjeNFY+N1w0+Hy1bS0L8IIPyIkS9TVTSi8CcTf8gJ0dz24BSVo446cbF3
         aBsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=trkPot4D4P6KfsYOzQpqmpa9FQAxVtvOC6vh58MIUmU=;
        b=RpQz1e5WoduUhTatqoMFH0sC/V4K7Wo8eJp7CgF0z2Go6zHjHv1TDNkyOwPrYkmi6v
         bTllYaujjflTpl9JrRvriVRK3MCtWD2NJafOwo2sLp67okiiL+2QbaW1AV2C/Q6NhptK
         XVjfelZ6+i2F9XyoVQQnQSNRmMmtvVx/Ci22lWLsSIXWsBwj6D6knDc/8rVLBEsHWLyE
         gjPANELAw+yzb+wKGzT2UodWU7VZ8txXNU84/gRUBBFxfroOpqkCp0hUTDgSBjtcTXZ/
         Tthr9mv9kQXyOOMeXZSZpfjVXtjTNJlO16++0DGPFegMtSrxZ50yMcXUuiRDi0XTWaEx
         H6Fg==
X-Gm-Message-State: AFqh2kocs9ChVDizglP1Aio7MerRk5pvFk5y1ZGfFPSoUgnUQ9vhLq2l
        pqXvIIPseuhGhIl5UXIv/xPQqjaeMH+KliQelIw=
X-Google-Smtp-Source: AMrXdXuas+8ZmLXM0+KKLJkmxJiekd4omoHODvd5EKA11LtLiaKRL0BQkqp4S7Yh6PlNTIULnxRiYCRAkzNKE0W9aqg=
X-Received: by 2002:a05:6830:3486:b0:675:cde9:90b9 with SMTP id
 c6-20020a056830348600b00675cde990b9mr432684otu.123.1674060857285; Wed, 18 Jan
 2023 08:54:17 -0800 (PST)
MIME-Version: 1.0
References: <20230118061256.2689-1-dakr@redhat.com> <db4fa0fc-c9a6-9a48-c45f-1d655b30aff9@amd.com>
 <02b0bcb8-f69f-93cf-1f56-ec883cb33965@redhat.com> <3602500f-05f5-10b8-5ec6-0a6246e2bb6b@amd.com>
 <bcbef353-f579-4e90-1c77-be36bbe61c0f@redhat.com> <CADnq5_PGaXFW-z3gt+R+W+vBVdeuL4wMuMOQh4muxU13Bemy3A@mail.gmail.com>
 <0f2d6e1a-a3b5-f323-a29d-caade427292c@redhat.com>
In-Reply-To: <0f2d6e1a-a3b5-f323-a29d-caade427292c@redhat.com>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Wed, 18 Jan 2023 11:54:05 -0500
Message-ID: <CADnq5_Nh-1esiHzvTG+qFBCfMjy21efX-YN2jfGG=WC+-4LwLQ@mail.gmail.com>
Subject: Re: [PATCH drm-next 00/14] [RFC] DRM GPUVA Manager & Nouveau VM_BIND UAPI
To:     Danilo Krummrich <dakr@redhat.com>
Cc:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        daniel@ffwll.ch, airlied@redhat.com, bskeggs@redhat.com,
        jason@jlekstrand.net, tzimmermann@suse.de, mripard@kernel.org,
        corbet@lwn.net, nouveau@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jan 18, 2023 at 11:50 AM Danilo Krummrich <dakr@redhat.com> wrote:
>
>
>
> On 1/18/23 17:30, Alex Deucher wrote:
> > On Wed, Jan 18, 2023 at 11:19 AM Danilo Krummrich <dakr@redhat.com> wro=
te:
> >>
> >> On 1/18/23 16:37, Christian K=C3=B6nig wrote:
> >>> Am 18.01.23 um 16:34 schrieb Danilo Krummrich:
> >>>> Hi Christian,
> >>>>
> >>>> On 1/18/23 09:53, Christian K=C3=B6nig wrote:
> >>>>> Am 18.01.23 um 07:12 schrieb Danilo Krummrich:
> >>>>>> This patch series provides a new UAPI for the Nouveau driver in
> >>>>>> order to
> >>>>>> support Vulkan features, such as sparse bindings and sparse reside=
ncy.
> >>>>>>
> >>>>>> Furthermore, with the DRM GPUVA manager it provides a new DRM core
> >>>>>> feature to
> >>>>>> keep track of GPU virtual address (VA) mappings in a more generic =
way.
> >>>>>>
> >>>>>> The DRM GPUVA manager is indented to help drivers implement
> >>>>>> userspace-manageable
> >>>>>> GPU VA spaces in reference to the Vulkan API. In order to achieve
> >>>>>> this goal it
> >>>>>> serves the following purposes in this context.
> >>>>>>
> >>>>>>       1) Provide a dedicated range allocator to track GPU VA
> >>>>>> allocations and
> >>>>>>          mappings, making use of the drm_mm range allocator.
> >>>>>
> >>>>> This means that the ranges are allocated by the kernel? If yes that=
's
> >>>>> a really really bad idea.
> >>>>
> >>>> No, it's just for keeping track of the ranges userspace has allocate=
d.
> >>>
> >>> Ok, that makes more sense.
> >>>
> >>> So basically you have an IOCTL which asks kernel for a free range? Or
> >>> what exactly is the drm_mm used for here?
> >>
> >> Not even that, userspace provides both the base address and the range,
> >> the kernel really just keeps track of things. Though, writing a UAPI o=
n
> >> top of the GPUVA manager asking for a free range instead would be
> >> possible by just adding the corresponding wrapper functions to get a
> >> free hole.
> >>
> >> Currently, and that's what I think I read out of your question, the ma=
in
> >> benefit of using drm_mm over simply stuffing the entries into a list o=
r
> >> something boils down to easier collision detection and iterating
> >> sub-ranges of the whole VA space.
> >
> > Why not just do this in userspace?  We have a range manager in
> > libdrm_amdgpu that you could lift out into libdrm or some other
> > helper.
>
> The kernel still needs to keep track of the mappings within the various
> VA spaces, e.g. it silently needs to unmap mappings that are backed by
> BOs that get evicted and remap them once they're validated (or swapped
> back in).

Ok, you are just using this for maintaining the GPU VM space in the kernel.

Alex

>
> >
> > Alex
> >
> >
> >>
> >>>
> >>> Regards,
> >>> Christian.
> >>>
> >>>>
> >>>> - Danilo
> >>>>
> >>>>>
> >>>>> Regards,
> >>>>> Christian.
> >>>>>
> >>>>>>
> >>>>>>       2) Generically connect GPU VA mappings to their backing
> >>>>>> buffers, in
> >>>>>>          particular DRM GEM objects.
> >>>>>>
> >>>>>>       3) Provide a common implementation to perform more complex m=
apping
> >>>>>>          operations on the GPU VA space. In particular splitting a=
nd
> >>>>>> merging
> >>>>>>          of GPU VA mappings, e.g. for intersecting mapping request=
s
> >>>>>> or partial
> >>>>>>          unmap requests.
> >>>>>>
> >>>>>> The new VM_BIND Nouveau UAPI build on top of the DRM GPUVA manager=
,
> >>>>>> itself
> >>>>>> providing the following new interfaces.
> >>>>>>
> >>>>>>       1) Initialize a GPU VA space via the new
> >>>>>> DRM_IOCTL_NOUVEAU_VM_INIT ioctl
> >>>>>>          for UMDs to specify the portion of VA space managed by th=
e
> >>>>>> kernel and
> >>>>>>          userspace, respectively.
> >>>>>>
> >>>>>>       2) Allocate and free a VA space region as well as bind and
> >>>>>> unbind memory
> >>>>>>          to the GPUs VA space via the new DRM_IOCTL_NOUVEAU_VM_BIN=
D
> >>>>>> ioctl.
> >>>>>>
> >>>>>>       3) Execute push buffers with the new DRM_IOCTL_NOUVEAU_EXEC =
ioctl.
> >>>>>>
> >>>>>> Both, DRM_IOCTL_NOUVEAU_VM_BIND and DRM_IOCTL_NOUVEAU_EXEC, make u=
se
> >>>>>> of the DRM
> >>>>>> scheduler to queue jobs and support asynchronous processing with D=
RM
> >>>>>> syncobjs
> >>>>>> as synchronization mechanism.
> >>>>>>
> >>>>>> By default DRM_IOCTL_NOUVEAU_VM_BIND does synchronous processing,
> >>>>>> DRM_IOCTL_NOUVEAU_EXEC supports asynchronous processing only.
> >>>>>>
> >>>>>> The new VM_BIND UAPI for Nouveau makes also use of drm_exec
> >>>>>> (execution context
> >>>>>> for GEM buffers) by Christian K=C3=B6nig. Since the patch implemen=
ting
> >>>>>> drm_exec was
> >>>>>> not yet merged into drm-next it is part of this series, as well as=
 a
> >>>>>> small fix
> >>>>>> for this patch, which was found while testing this series.
> >>>>>>
> >>>>>> This patch series is also available at [1].
> >>>>>>
> >>>>>> There is a Mesa NVK merge request by Dave Airlie [2] implementing =
the
> >>>>>> corresponding userspace parts for this series.
> >>>>>>
> >>>>>> The Vulkan CTS test suite passes the sparse binding and sparse
> >>>>>> residency test
> >>>>>> cases for the new UAPI together with Dave's Mesa work.
> >>>>>>
> >>>>>> There are also some test cases in the igt-gpu-tools project [3] fo=
r
> >>>>>> the new UAPI
> >>>>>> and hence the DRM GPU VA manager. However, most of them are testin=
g
> >>>>>> the DRM GPU
> >>>>>> VA manager's logic through Nouveau's new UAPI and should be
> >>>>>> considered just as
> >>>>>> helper for implementation.
> >>>>>>
> >>>>>> However, I absolutely intend to change those test cases to proper
> >>>>>> kunit test
> >>>>>> cases for the DRM GPUVA manager, once and if we agree on it's
> >>>>>> usefulness and
> >>>>>> design.
> >>>>>>
> >>>>>> [1]
> >>>>>> https://gitlab.freedesktop.org/nouvelles/kernel/-/tree/new-uapi-dr=
m-next /
> >>>>>> https://gitlab.freedesktop.org/nouvelles/kernel/-/merge_requests/1
> >>>>>> [2] https://gitlab.freedesktop.org/nouveau/mesa/-/merge_requests/1=
50/
> >>>>>> [3]
> >>>>>> https://gitlab.freedesktop.org/dakr/igt-gpu-tools/-/tree/wip_nouve=
au_vm_bind
> >>>>>>
> >>>>>> I also want to give credit to Dave Airlie, who contributed a lot o=
f
> >>>>>> ideas to
> >>>>>> this patch series.
> >>>>>>
> >>>>>> Christian K=C3=B6nig (1):
> >>>>>>     drm: execution context for GEM buffers
> >>>>>>
> >>>>>> Danilo Krummrich (13):
> >>>>>>     drm/exec: fix memory leak in drm_exec_prepare_obj()
> >>>>>>     drm: manager to keep track of GPUs VA mappings
> >>>>>>     drm: debugfs: provide infrastructure to dump a DRM GPU VA spac=
e
> >>>>>>     drm/nouveau: new VM_BIND uapi interfaces
> >>>>>>     drm/nouveau: get vmm via nouveau_cli_vmm()
> >>>>>>     drm/nouveau: bo: initialize GEM GPU VA interface
> >>>>>>     drm/nouveau: move usercopy helpers to nouveau_drv.h
> >>>>>>     drm/nouveau: fence: fail to emit when fence context is killed
> >>>>>>     drm/nouveau: chan: provide nouveau_channel_kill()
> >>>>>>     drm/nouveau: nvkm/vmm: implement raw ops to manage uvmm
> >>>>>>     drm/nouveau: implement uvmm for user mode bindings
> >>>>>>     drm/nouveau: implement new VM_BIND UAPI
> >>>>>>     drm/nouveau: debugfs: implement DRM GPU VA debugfs
> >>>>>>
> >>>>>>    Documentation/gpu/driver-uapi.rst             |   11 +
> >>>>>>    Documentation/gpu/drm-mm.rst                  |   43 +
> >>>>>>    drivers/gpu/drm/Kconfig                       |    6 +
> >>>>>>    drivers/gpu/drm/Makefile                      |    3 +
> >>>>>>    drivers/gpu/drm/amd/amdgpu/Kconfig            |    1 +
> >>>>>>    drivers/gpu/drm/drm_debugfs.c                 |   56 +
> >>>>>>    drivers/gpu/drm/drm_exec.c                    |  294 ++++
> >>>>>>    drivers/gpu/drm/drm_gem.c                     |    3 +
> >>>>>>    drivers/gpu/drm/drm_gpuva_mgr.c               | 1323
> >>>>>> +++++++++++++++++
> >>>>>>    drivers/gpu/drm/nouveau/Kbuild                |    3 +
> >>>>>>    drivers/gpu/drm/nouveau/Kconfig               |    2 +
> >>>>>>    drivers/gpu/drm/nouveau/include/nvif/if000c.h |   23 +-
> >>>>>>    drivers/gpu/drm/nouveau/include/nvif/vmm.h    |   17 +-
> >>>>>>    .../gpu/drm/nouveau/include/nvkm/subdev/mmu.h |   10 +
> >>>>>>    drivers/gpu/drm/nouveau/nouveau_abi16.c       |   23 +
> >>>>>>    drivers/gpu/drm/nouveau/nouveau_abi16.h       |    1 +
> >>>>>>    drivers/gpu/drm/nouveau/nouveau_bo.c          |  152 +-
> >>>>>>    drivers/gpu/drm/nouveau/nouveau_bo.h          |    2 +-
> >>>>>>    drivers/gpu/drm/nouveau/nouveau_chan.c        |   16 +-
> >>>>>>    drivers/gpu/drm/nouveau/nouveau_chan.h        |    1 +
> >>>>>>    drivers/gpu/drm/nouveau/nouveau_debugfs.c     |   24 +
> >>>>>>    drivers/gpu/drm/nouveau/nouveau_drm.c         |   25 +-
> >>>>>>    drivers/gpu/drm/nouveau/nouveau_drv.h         |   92 +-
> >>>>>>    drivers/gpu/drm/nouveau/nouveau_exec.c        |  310 ++++
> >>>>>>    drivers/gpu/drm/nouveau/nouveau_exec.h        |   55 +
> >>>>>>    drivers/gpu/drm/nouveau/nouveau_fence.c       |    7 +
> >>>>>>    drivers/gpu/drm/nouveau/nouveau_fence.h       |    2 +-
> >>>>>>    drivers/gpu/drm/nouveau/nouveau_gem.c         |   83 +-
> >>>>>>    drivers/gpu/drm/nouveau/nouveau_mem.h         |    5 +
> >>>>>>    drivers/gpu/drm/nouveau/nouveau_prime.c       |    2 +-
> >>>>>>    drivers/gpu/drm/nouveau/nouveau_sched.c       |  780 ++++++++++
> >>>>>>    drivers/gpu/drm/nouveau/nouveau_sched.h       |   98 ++
> >>>>>>    drivers/gpu/drm/nouveau/nouveau_svm.c         |    2 +-
> >>>>>>    drivers/gpu/drm/nouveau/nouveau_uvmm.c        |  575 +++++++
> >>>>>>    drivers/gpu/drm/nouveau/nouveau_uvmm.h        |   68 +
> >>>>>>    drivers/gpu/drm/nouveau/nouveau_vmm.c         |    4 +-
> >>>>>>    drivers/gpu/drm/nouveau/nvif/vmm.c            |   73 +-
> >>>>>>    .../gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c    |  168 ++-
> >>>>>>    .../gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.h    |    1 +
> >>>>>>    drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c |   32 +-
> >>>>>>    drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h |    3 +
> >>>>>>    include/drm/drm_debugfs.h                     |   25 +
> >>>>>>    include/drm/drm_drv.h                         |    6 +
> >>>>>>    include/drm/drm_exec.h                        |  144 ++
> >>>>>>    include/drm/drm_gem.h                         |   75 +
> >>>>>>    include/drm/drm_gpuva_mgr.h                   |  527 +++++++
> >>>>>>    include/uapi/drm/nouveau_drm.h                |  216 +++
> >>>>>>    47 files changed, 5266 insertions(+), 126 deletions(-)
> >>>>>>    create mode 100644 drivers/gpu/drm/drm_exec.c
> >>>>>>    create mode 100644 drivers/gpu/drm/drm_gpuva_mgr.c
> >>>>>>    create mode 100644 drivers/gpu/drm/nouveau/nouveau_exec.c
> >>>>>>    create mode 100644 drivers/gpu/drm/nouveau/nouveau_exec.h
> >>>>>>    create mode 100644 drivers/gpu/drm/nouveau/nouveau_sched.c
> >>>>>>    create mode 100644 drivers/gpu/drm/nouveau/nouveau_sched.h
> >>>>>>    create mode 100644 drivers/gpu/drm/nouveau/nouveau_uvmm.c
> >>>>>>    create mode 100644 drivers/gpu/drm/nouveau/nouveau_uvmm.h
> >>>>>>    create mode 100644 include/drm/drm_exec.h
> >>>>>>    create mode 100644 include/drm/drm_gpuva_mgr.h
> >>>>>>
> >>>>>>
> >>>>>> base-commit: 0b45ac1170ea6416bc1d36798414c04870cd356d
> >>>>>
> >>>>
> >>>
> >>
> >
>
