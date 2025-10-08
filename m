Return-Path: <linux-doc+bounces-62734-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA7CBC60DF
	for <lists+linux-doc@lfdr.de>; Wed, 08 Oct 2025 18:41:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 857FD3BDC10
	for <lists+linux-doc@lfdr.de>; Wed,  8 Oct 2025 16:41:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73F462BE7AA;
	Wed,  8 Oct 2025 16:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="b11JwAUF"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF6D2BE056
	for <linux-doc@vger.kernel.org>; Wed,  8 Oct 2025 16:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759941676; cv=none; b=fORHR99vIEF03wfQE1G9dU9HHoJaOkq9HFREIB9GgGKdu/HNUVrwVSRfzEK44YuMXEnF2L+JtYGHsEEBOkwx+/KG81zjI9AyaE8lnwHEAdmdlBsiJMA6XksYcds33eaXeXTbEmZHUNxhaA+gQEL/wH++7fyA7OWJeutSmpGwfFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759941676; c=relaxed/simple;
	bh=b4idqNyL4YqtpeHTeTGmVP16fTaIZlheO+egf515s/I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pWTVe+A/N92gk+lO4UNb7VbjKYG6XJ+15NzZd21UdUFjIjqolTCamW7jSGehVkUoit+4LYOfXqgsmGeBICim1PL5P9+bAtCpT8vlfE1I00pnARVOZ0kyr38whRTJzNMmIE+cIDzZhQ8uqkpz6Cy2V2L9YksapV3Dw6lIpQqC7t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=b11JwAUF; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-85e76e886a0so1834485a.1
        for <linux-doc@vger.kernel.org>; Wed, 08 Oct 2025 09:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1759941672; x=1760546472; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y0QDDkoHx1oddr1kYoPe9XtgfxjyTTRXUHnhEvUEaHE=;
        b=b11JwAUFkNkQDWqpvTxV6OoNxFgYVwdp8Zv37cEk+5NbXnkESCTKMtwafnhFWdja6A
         vB6kFoXITsjhOUnIcULvZRsVQ3Hr3V7oIXlNFLQz3zYkg58qDu6SnfQsfi5fpV6hb/3i
         imGja1v4XsX7pYnidxP8EuvqA03bSSgWWTfLallqyeBNpTQY78hQWVlMUOGcsQPrTcd9
         yqgHES5wnUI5OCY+6Ahq3EUPJ3o0vTJNOrEmhHzu7tibvr7xW4dI112D0aaqTfjjjI4y
         /F6I4pXWDSC6U5dRXCRhJk7X/PKzbFPgADptPekiX0Cp1u+2UFIks1QV+OHs0oV+CbTH
         gb3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759941672; x=1760546472;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y0QDDkoHx1oddr1kYoPe9XtgfxjyTTRXUHnhEvUEaHE=;
        b=fGGTjmuxJmMSJJlO3SUikRReOQdl6SgAUdnCeY0W52deldqCQJRIxOyuflWof24yLy
         D2flCEizPxGEEmFvdBi/wT7zAh5ZxmE7NUhzxn9UhgZTcYE9r9gWX0nRWLLIZKFp3K9e
         uLjsQWeJFn0AU/Hx3i8m4j/yqcqDyY0+IPY1fxd01iimBN2dhfFKAvm19DQDyLkC8Hw1
         YIsQ23gr9ps8D5cHhCseIOeJ6iIGK/U2IH7imTD36lZsaqKDQNPta8JqS+PEgxMxfr9T
         vlsp1VeFlY6k4a6MbuzCJNtib+2fz8ifa1FwIxL9mSuAYR/RYdXlwiuSinyneqtsIFA3
         o3/w==
X-Forwarded-Encrypted: i=1; AJvYcCWfqP2qFfhFALmU8zmrF7txkBuB2qXX6BFI32WDREnRH9U0yTUbP6RQIYp6wu3fXpsSrmKXoESCubA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwEZTc4prAtUFaJjbk9Sf0BJkzQE6RU8pZ8Pn20lLv6lpaqVM1
	b0CMQxC/s5hmu+MC3jMIM0EjuTJo0AOl9lPCJOX4YQEVud4xzAKmIdjoELekRQVoB5LdPrONgT/
	FUYEKnVGvi2SQ+vMO504N97JXWr7g4r5LRtpP2QuUIA==
X-Gm-Gg: ASbGncuTHPbDa5qFetzApnKak0JY6oFA5sWtqxbWlPNwJ4uiIZGlf/B2wrq9pu6f34+
	PEVmg5T/HpQ1qYJjLhKFZGw4/FtQcoE8OPweAdpgYRi17max1o3WrvOZbQgh6Ey/HSCfsW3IoAG
	vjviICBABEYrPWSDAwejryCyMwM1N+WTSyaflrElHaOVMXRZLCABBCFExo6pJzq4xME/kMWjAOi
	UyUsx9+210RPs5VEfq/iFavTrup
X-Google-Smtp-Source: AGHT+IE3RKIZb1iIOLaTyMNTcxfyaBM7YSPyWPYytKjmmpW9kMu81LYT+MqTFPjCR/XhBeZkyeuypkTguw/UEdpotf8=
X-Received: by 2002:a05:620a:410c:b0:829:b669:c791 with SMTP id
 af79cd13be357-88352d9a448mr549049785a.78.1759941671964; Wed, 08 Oct 2025
 09:41:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250929010321.3462457-1-pasha.tatashin@soleen.com>
 <CA+CK2bB+RdapsozPHe84MP4NVSPLo6vje5hji5MKSg8L6ViAbw@mail.gmail.com> <CAAywjhSP=ugnSJOHPGmTUPGh82wt+qnaqZAqo99EfhF-XHD5Sg@mail.gmail.com>
In-Reply-To: <CAAywjhSP=ugnSJOHPGmTUPGh82wt+qnaqZAqo99EfhF-XHD5Sg@mail.gmail.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 8 Oct 2025 12:40:34 -0400
X-Gm-Features: AS18NWBehU4q9WUE9mwN1N00X-Mv4SLEo64BJ5126E8o614dVWx--_4ZFo216so
Message-ID: <CA+CK2bAG+YAS7oSpdrZYDK0LU2mhfRuj2qTJtT-Hn8FLUbt=Dw@mail.gmail.com>
Subject: Re: [PATCH v4 00/30] Live Update Orchestrator
To: Samiullah Khawaja <skhawaja@google.com>
Cc: pratyush@kernel.org, jasonmiu@google.com, graf@amazon.com, 
	changyuanl@google.com, rppt@kernel.org, dmatlack@google.com, 
	rientjes@google.com, corbet@lwn.net, rdunlap@infradead.org, 
	ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com, ojeda@kernel.org, 
	aliceryhl@google.com, masahiroy@kernel.org, akpm@linux-foundation.org, 
	tj@kernel.org, yoann.congal@smile.fr, mmaurer@google.com, 
	roman.gushchin@linux.dev, chenridong@huawei.com, axboe@kernel.dk, 
	mark.rutland@arm.com, jannh@google.com, vincent.guittot@linaro.org, 
	hannes@cmpxchg.org, dan.j.williams@intel.com, david@redhat.com, 
	joel.granados@kernel.org, rostedt@goodmis.org, anna.schumaker@oracle.com, 
	song@kernel.org, zhangguopeng@kylinos.cn, linux@weissschuh.net, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	gregkh@linuxfoundation.org, tglx@linutronix.de, mingo@redhat.com, 
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	rafael@kernel.org, dakr@kernel.org, bartosz.golaszewski@linaro.org, 
	cw00.choi@samsung.com, myungjoo.ham@samsung.com, yesanishhere@gmail.com, 
	Jonathan.Cameron@huawei.com, quic_zijuhu@quicinc.com, 
	aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, 
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com, 
	stuart.w.hayes@gmail.com, ptyadav@amazon.de, lennart@poettering.net, 
	brauner@kernel.org, linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	saeedm@nvidia.com, ajayachandra@nvidia.com, jgg@nvidia.com, parav@nvidia.com, 
	leonro@nvidia.com, witu@nvidia.com, hughd@google.com, chrisl@kernel.org, 
	steven.sistare@oracle.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 8, 2025 at 3:04=E2=80=AFAM Samiullah Khawaja <skhawaja@google.c=
om> wrote:
>
> On Tue, Oct 7, 2025 at 10:11=E2=80=AFAM Pasha Tatashin
> <pasha.tatashin@soleen.com> wrote:
> >
> > On Sun, Sep 28, 2025 at 9:03=E2=80=AFPM Pasha Tatashin
> > <pasha.tatashin@soleen.com> wrote:
> > >
> > > This series introduces the Live Update Orchestrator (LUO), a kernel
> > > subsystem designed to facilitate live kernel updates. LUO enables
> > > kexec-based reboots with minimal downtime, a critical capability for
> > > cloud environments where hypervisors must be updated without disrupti=
ng
> > > running virtual machines. By preserving the state of selected resourc=
es,
> > > such as file descriptors and memory, LUO allows workloads to resume
> > > seamlessly in the new kernel.
> > >
> > > The git branch for this series can be found at:
> > > https://github.com/googleprodkernel/linux-liveupdate/tree/luo/v4
> > >
> > > The patch series applies against linux-next tag: next-20250926
> > >
> > > While this series is showed cased using memfd preservation. There are
> > > works to preserve devices:
> > > 1. IOMMU: https://lore.kernel.org/all/20250928190624.3735830-16-skhaw=
aja@google.com
> > > 2. PCI: https://lore.kernel.org/all/20250916-luo-pci-v2-0-c494053c3c0=
8@kernel.org
> > >
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > Changelog since v3:
> > > (https://lore.kernel.org/all/20250807014442.3829950-1-pasha.tatashin@=
soleen.com):
> > >
> > > - The main architectural change in this version is introduction of
> > >   "sessions" to manage the lifecycle of preserved file descriptors.
> > >   In v3, session management was left to a single userspace agent. Thi=
s
> > >   approach has been revised to improve robustness. Now, each session =
is
> > >   represented by a file descriptor (/dev/liveupdate). The lifecycle o=
f
> > >   all preserved resources within a session is tied to this FD, ensuri=
ng
> > >   automatic cleanup by the kernel if the controlling userspace agent
> > >   crashes or exits unexpectedly.
> > >
> > > - The first three KHO fixes from the previous series have been merged
> > >   into Linus' tree.
> > >
> > > - Various bug fixes and refactorings, including correcting memory
> > >   unpreservation logic during a kho_abort() sequence.
> > >
> > > - Addressing all comments from reviewers.
> > >
> > > - Removing sysfs interface (/sys/kernel/liveupdate/state), the state
> > >   can now be queried  only via ioctl() API.
> > >
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > Hi all,
> >
> > Following up on yesterday's Hypervisor Live Update meeting, we
> > discussed the requirements for the LUO to track dependencies,
> > particularly for IOMMU preservation and other stateful file
> > descriptors. This email summarizes the main design decisions and
> > outcomes from that discussion.
> >
> > For context, the notes from the previous meeting can be found here:
> > https://lore.kernel.org/all/365acb25-4b25-86a2-10b0-1df98703e287@google=
.com
> > The notes for yesterday's meeting are not yes available.
> >
> > The key outcomes are as follows:
> >
> > 1. User-Enforced Ordering
> > -------------------------
> > The responsibility for enforcing the correct order of operations will
> > lie with the userspace agent. If fd_A is a dependency for fd_B,
> > userspace must ensure that fd_A is preserved before fd_B. This same
> > ordering must be honored during the restoration phase after the reboot
> > (fd_A must be restored before fd_B). The kernel preserve the ordering.
> >
> > 2. Serialization in PRESERVE_FD
> > -------------------------------
> > To keep the global prepare() phase lightweight and predictable, the
> > consensus was to shift the heavy serialization work into the
> > PRESERVE_FD ioctl handler. This means that when userspace requests to
> > preserve a file, the file handler should perform the bulk of the
> > state-saving work immediately.
> >
> > The proposed sequence of operations reflects this shift:
> >
> > Shutdown Flow:
> > fd_preserve() (heavy serialization) -> prepare() (lightweight final
> > checks) -> Suspend VM -> reboot(KEXEC) -> freeze() (lightweight)
> >
> > Boot & Restore Flow:
> > fd_restore() (lightweight object creation) -> Resume VM -> Heavy
> > post-restore IOCTLs (e.g., hardware page table re-creation) ->
> > finish() (lightweight cleanup)
> >
> > This decision primarily serves as a guideline for file handler
> > implementations. For the LUO core, this implies minor API changes,
> > such as renaming can_preserve() to a more active preserve() and adding
> > a corresponding unpreserve() callback to be called during
> > UNPRESERVE_FD.
> >
> > 3. FD Data Query API
> > --------------------
> > We identified the need for a kernel API to allow subsystems to query
> > preserved FD data during the boot process, before userspace has
> > initiated the restore.
> >
> > The proposed API would allow a file handler to retrieve a list of all
> > its preserved FDs, including their session names, tokens, and the
> > private data payload.
> >
> > Proposed Data Structure:
> >
> > struct liveupdate_fd {
> >         char *session; /* session name */
> >         u64 token; /* Preserved FD token */
> >         u64 data; /* Private preserved data */
> > };
> >
> > Proposed Function:
> > liveupdate_fd_data_query(struct liveupdate_file_handler *h,
> >                          struct liveupdate_fd *fds, long *count);
> >
> > 4. New File-Lifecycle-Bound Global State
> > ----------------------------------------
> > A new mechanism for managing global state was proposed, designed to be
> > tied to the lifecycle of the preserved files themselves. This would
> > allow a file owner (e.g., the IOMMU subsystem) to save and retrieve
> > global state that is only relevant when one or more of its FDs are
> > being managed by LUO.
> >
> > The key characteristics of this new mechanism are:
> > The global state is optionally created on the first preserve() call
> > for a given file handler.
> > The state can be updated on subsequent preserve() calls.
> > The state is destroyed when the last corresponding file is unpreserved
> > or finished.
> > The data can be accessed during boot.
> >
> > I am thinking of an API like this.

Sami and I discussed this further, and we agree that the proposed API
will work. We also identified two additional requirements that were
not mentioned in my previous email:

1. Ordered Un-preservation
The un-preservation of file descriptors must also be ordered and must
occur in the reverse order of preservation. For example, if a user
preserves a memfd first and then an iommufd that depends on it, the
iommufd must be un-preserved before the memfd when the session is
closed or the FDs are explicitly un-preserved.

2. New API to Check Preservation Status
A new LUO API will be needed to check if a struct file is already
preserved within a session. This is needed for dependency validation.
The proposed function would look like this:

bool liveupdate_is_file_preserved(struct liveupdate_session *session,
struct file *file);

This will allow the file handler for one FD (e.g., iommufd) to verify
during its preserve() callback that its dependencies (e.g., the
backing memfd) have already been preserved in the same session.

Pasha

