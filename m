Return-Path: <linux-doc+bounces-47125-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 02155AC0848
	for <lists+linux-doc@lfdr.de>; Thu, 22 May 2025 11:14:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A1DA54A600D
	for <lists+linux-doc@lfdr.de>; Thu, 22 May 2025 09:14:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07772267F61;
	Thu, 22 May 2025 09:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="l9hrgqoD"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFBF2222AA
	for <linux-doc@vger.kernel.org>; Thu, 22 May 2025 09:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747905292; cv=none; b=mQVbLezYzmyqY38wD4UK0zHnIXzG85NesaSnRSQLRg7+ApUrIQxkzHk4+SxB3kuMm+56EfjZS1/0EmAkfw9BlA8YR7lShW3atgojynsvZuaHKNCj3aX3lY3mkAUdQEQ2IxtGXG1hno9X+PMJuGN5B9//ukQCXlvl7FSobSdI/f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747905292; c=relaxed/simple;
	bh=yPEzhJ1VGkWekJKIK5gnTTnrZRwjQc9hAl5EQLOHkTk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=awspWh0cUpGYao9ujRtrLv9SRF0rifsAjDzzzVbjF6pavBcleSCCECELB6TOosu3Tmrc21LsqsDIyVBWRE7ly9g9le99PqDIvkDSXO9l05hfULnGi42c1C1gdvQo/5RdFKdEbZx1XYPBxXuEOP12zMocw7h/eNUa9k3R8tZtHjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=l9hrgqoD; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac34257295dso1230367066b.2
        for <linux-doc@vger.kernel.org>; Thu, 22 May 2025 02:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747905289; x=1748510089; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yPEzhJ1VGkWekJKIK5gnTTnrZRwjQc9hAl5EQLOHkTk=;
        b=l9hrgqoDCR/uPi5gMQ6hFvfWYuuz1IOtSGkIiw9D4xvhaS6wb4vaON1bEmY6pGEKVE
         Zi8ofg4ZqJIMVbNQJNrXEe7rhCLDWfe42Lwu2fksLS6MuHVL1XV3pkskB6xDjfebH1qs
         /cwboMBbxwPcpNtD+EyyzYj+Kzu5iEBHa4WKxpsk+yYc9APKwxsGmy0gSKKYJ3i8y7PF
         BZH5bs+nKx5+wOcRnf5Me9/uLEdRbqs9O+H9hDPeMreCdNv7G6g1eXeGkxnE1edI2xLh
         qanVx4Gv6zwlh4sPiVWLHVrmKCfl6YyWY+SCG4p8bzG4vK9WoymZIWgibRzbEuU0BGgd
         57fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747905289; x=1748510089;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yPEzhJ1VGkWekJKIK5gnTTnrZRwjQc9hAl5EQLOHkTk=;
        b=mv75+UwF37yZ+4h6RCrVjkyMAxmQcC2S9RNfbLid6LtbM7gEuQ3V79i0k/niFcu1ZP
         wUyVSQQ/qdYoeZ8HpYS980NzSRts/DbeCvzOdcm+3p8v2EFz+iy4D3oGpyetD10QWYr5
         glRYvXUmG+VQ8YS6+tSgyCNqiKtNOlTa717s0fnaiH5sCKtD8JFhweB3DQnXExIYEBlL
         DpN2wIuAWhIwe+/6DNTLeGnMNLlv360g1hnqWqYRYPjD/uE+jwR3HR7pU/LjW51BfuE2
         oNmxbwy+Zf9oAhdEM5+DwQrgYVRvJ3rV9KHl9bGgXkUUkGumkopieVQ5XodwyHc4TvYH
         xG0A==
X-Forwarded-Encrypted: i=1; AJvYcCVolTze+Yu9U/+4GmJbd5wWXkcY6+rzoglR+w+8Nv7uE/akVz2xm8swI8/Kzr1ZG3zSN3EVx6YKm2w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7bnozlM2rOTodyLcb6WCx4LRlIH8zQVNaFXdjkFzIaF1EXyYT
	zJ7N6exXcAY4XfYWbt1CK46man+CSJ3pbWOSEwEaXzmOuvRTndcmvXjsaFvXU983KjrjZaTx4hh
	DG2gVt0VK8GUV5Ra0SCU780sRB2gM0FFm+TlU5/rp
X-Gm-Gg: ASbGncsoPeC30lf3BEJzqRpOEllgG1xPqBxQONm+NT7bFXzAbrjWSUukjtG5v4cPIfH
	OvTR9jv5mbH2cYu6bGpW6id9lIbC0Bf1CZ7Dl1fZKd2l07Vaf/J/Xwwi1Ys8s3krlf6WOUqBIkJ
	b7xxbr315lOYArikMuif6u3om8row1szut9eHSV28Y24Rs6LueVtD+QoZhe4aYjQtXICpOVUwQo
	NHkGufTYvYy
X-Google-Smtp-Source: AGHT+IFDa3ewC071iRmLXF9aFjT5k5BIB7bxRZo61X7gO695TNiEGA8zwKr0nYWn60rHu8vGzkU0kNIAKD8PvXdbuGc=
X-Received: by 2002:a17:907:1b18:b0:ad2:532e:abe9 with SMTP id
 a640c23a62f3a-ad52d4383camr2148091866b.1.1747905289173; Thu, 22 May 2025
 02:14:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1747349530.git.babu.moger@amd.com> <CALPaoChSzzU5mzMZsdT6CeyEn0WD1qdT9fKCoNW_ty4tojtrkw@mail.gmail.com>
 <4dbcea13-382e-4af2-960d-0e66652cc2f5@amd.com> <8dd6e3a0-b2e1-48a7-8fa4-62e78b1407ae@intel.com>
 <6c77b065-a54e-4b9c-a4cf-8b81676f2ab2@amd.com> <f4178258-f7ad-4db2-9284-3f28e8ee8d00@intel.com>
 <92bcab75-72c6-46d4-97a2-119e7124c90c@amd.com> <11465976-f030-4c1b-88c6-3eebf0c8f13b@intel.com>
 <CALPaoCgtcz6tZnmeH8v4r2=HRVh7qEDZgraLU+Euhq3qLkRZhA@mail.gmail.com> <31aec24f-b3df-4a8a-910d-6df175962e84@intel.com>
In-Reply-To: <31aec24f-b3df-4a8a-910d-6df175962e84@intel.com>
From: Peter Newman <peternewman@google.com>
Date: Thu, 22 May 2025 11:14:38 +0200
X-Gm-Features: AX0GCFvcrUtKEQVNxrFeDbCvjPcbo2oRBH8TH0Kp3zXiwMns9-LC25AqGG6bkxw
Message-ID: <CALPaoCj438UfH3QA_VnGo-pj2a_48sJufUWjBKT3MQatcMJ_Uw@mail.gmail.com>
Subject: Re: [PATCH v13 00/27] x86/resctrl : Support AMD Assignable Bandwidth
 Monitoring Counters (ABMC)
To: Reinette Chatre <reinette.chatre@intel.com>
Cc: "Moger, Babu" <bmoger@amd.com>, babu.moger@amd.com, corbet@lwn.net, tony.luck@intel.com, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, james.morse@arm.com, dave.martin@arm.com, 
	fenghuay@nvidia.com, x86@kernel.org, hpa@zytor.com, paulmck@kernel.org, 
	akpm@linux-foundation.org, thuth@redhat.com, rostedt@goodmis.org, 
	ardb@kernel.org, gregkh@linuxfoundation.org, daniel.sneddon@linux.intel.com, 
	jpoimboe@kernel.org, alexandre.chartre@oracle.com, 
	pawan.kumar.gupta@linux.intel.com, thomas.lendacky@amd.com, 
	perry.yuan@amd.com, seanjc@google.com, kai.huang@intel.com, 
	xiaoyao.li@intel.com, kan.liang@linux.intel.com, xin3.li@intel.com, 
	ebiggers@google.com, xin@zytor.com, sohil.mehta@intel.com, 
	andrew.cooper3@citrix.com, mario.limonciello@amd.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	maciej.wieczor-retman@intel.com, eranian@google.com, Xiaojian.Du@amd.com, 
	gautham.shenoy@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Reinette,

On Thu, May 22, 2025 at 1:05=E2=80=AFAM Reinette Chatre
<reinette.chatre@intel.com> wrote:
>
> Hi Peter,
>
> On 5/21/25 7:27 AM, Peter Newman wrote:
> > On Wed, May 21, 2025 at 1:44=E2=80=AFAM Reinette Chatre
> > <reinette.chatre@intel.com> wrote:
> >> On 5/20/25 4:25 PM, Moger, Babu wrote:
>
> ...
> >>>
> >>> Here=E2=80=99s my current understanding of soft-ABMC. Peter may have =
a more in-depth perspective on this.
> >>>
> >>> Soft-ABMC:
> >>> a. num_mbm_cntrs: This is a software-defined limit based on the numbe=
r of active RMIDs that can be supported. The value can be obtained using th=
e code referenced in [4].
> >>>
> >>> b. Assignments: No hardware configuration is required. We simply need=
 to ensure that no more than num_mbm_cntrs RMIDs are active at any given ti=
me.
> >>>
> >>> c. Configuration: Controlled via /info/L3_MON/mbm_total_bytes_config =
and mbm_local_bytes_config.
> >>>
> >>> d. Events: Only two events can be assigned(local and total).
> >>>
> >>> ABMC:
> >>> a. num_mbm_cntrs: This is defined by the hardware.
> >>> b. Assignments: Requires special MSR writes to assign counters.
> >>> c. Configuration: Comes from /info/L3_MON/counter_configs/.
> >>> d. Events: More than two events can be assigned to a group (currently=
 up to 2).
> >>>
> >>> Commonalities:
> >>> a. Assignments can be either exclusive or shared in both these modes.
> >>>
> >>> Given these, I believe we can easily accommodate soft-ABMC in this in=
terface.
> >>
> >> This is not so obvious to me. It looks to me as though the user is for=
ced to interpret
> >> the content of resctrl files differently based on soft-ABMC vs ABMC ma=
king the interface
> >> inconsistent and user thus needing to know details of implementations.=
 This is what the previous
> >> discussion I linked to aimed to address. It sounds to me as though you=
 believe that this is no longer
> >> an issue. Could you please show examples of what a user can expect fro=
m the interfaces and how a user
> >> will interact with the interfaces on both a non-ABMC and ABMC system?
> >
> > At the interface level, I think mbm_L3_assignments on a non-ABMC
> > system would only need to contain a single line:
> >
> > 0=3Ds;1=3Ds;...;31=3Ds
>
> It should be obvious to user space how to interpret the fields. When ther=
e is
> thus a single "mbm_cntr_assign" mode used for ABMC and soft-ABMC a single
> line like this would be difficult to parse since that would imply/require
> that user space knows whether it is running on ABMC or soft-ABMC system,
> which we should avoid.
>
> If there are different modes, for example "mbm_cntr_event_assign" and
> "mbm_cntr_group_assign" then this could be used by user space to distingu=
ish
> how to interact with mbm_L3_assignments making something like this possib=
le.

I meant to say I was proposing the format of this file when in the
group assignment mode. I didn't mean to imply that a separate mode
wasn't needed.

>
> >
> > But maybe for consistency we would synthesize a single, unmodifiable
> > counter configuration to reflect that allocating an RMID in a domain
> > results in assignment to all events and deallocating the RMID
> > unassigns all events. We could call it "group" to say it's assigning
> > at the group level, or perhaps just '*':
> >
> > *:0=3Ds;1=3Ds;...;31=3Ds
> >
> > I'm not sure about allowing a '*' on ABMC hardware, because it could
> > be interpreted as allocating a lot of counters when a large number of
> > event configurations exist.
> >
> > *:0=3Ds;1=3Ds;...;31=3Ds
> >
>
> Either could work also. Whether it is "group" or "*" ABMC systems could
> respond with "not supported". Will think about this more but would
> like to hear your opinion about the flexibility that distinguishing betwe=
en
> a "mbm_cntr_event_assign" and "mbm_cntr_group_assign" mode provides.

I agree it's clearer when they are separate modes. Between "*" and
"group", I prefer "group" because it seems the least ambiguous.

I just want to make sure we'd never want both modes at the same time,
such as an implementation with both a small number of monitoring IDs
and a small number of MBM counters. I support one MPAM implementation
that has a small number of PARTIDs and only one MBWU counter per
domain. Fingers crossed that the number of PARTIDs it supports isn't
small compared to the number of jobs we would run on it. Otherwise
maybe it will work out to just pick the more limited of the two
(monitor IDs or counters) and make allocation of one drive the other.

(In case you read this before my earlier reply[1], see the note about
rdtgroup pointers in the task_struct, as this is a prerequisite for
overcommitting HW monitor IDs.)

Thanks,
-Peter

[1] https://lore.kernel.org/lkml/CALPaoCjh_NXQLtNBqei=3D7a6Jsr17fEnPO+kqMaN=
q4xNu2UPDJA@mail.gmail.com/

>
> Reinette
>
> > -Peter
> >
> >
> >>
> >> Thank you
> >>
> >> Reinette
> >>
> >>>
> >>>>>>
> >>>>>> [2] https://lore.kernel.org/lkml/afb99efe-0de2-f7ad-d0b8-f2a0ea998=
efd@amd.com/
> >>>>>> [3] https://lore.kernel.org/lkml/CALPaoCg3KpF94g2MEmfP_Ro2mQZYFA8s=
KVkmb+7isotKNgdY9A@mail.gmail.com/
> >>>>>
> >>>>
> >>>>
> >>>
> >>
>

