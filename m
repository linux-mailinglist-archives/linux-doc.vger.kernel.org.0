Return-Path: <linux-doc+bounces-31821-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B94E9DFF44
	for <lists+linux-doc@lfdr.de>; Mon,  2 Dec 2024 11:46:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F2B72B2352A
	for <lists+linux-doc@lfdr.de>; Mon,  2 Dec 2024 10:43:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADDE31FCCE8;
	Mon,  2 Dec 2024 10:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WxcgSbQa"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADCC1FC0F3
	for <linux-doc@vger.kernel.org>; Mon,  2 Dec 2024 10:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733136222; cv=none; b=pP2msXSOOkKOFB1/KgvkWkBAYLD2yIM6tl8twsbOtvRe6vCuJKen4lKGT6V1UluKmiA7a1W62DNC9zlMTWvM8zW8LHXmk2XS4yD2qpbnhvDgtAFiNVCyLk+FZJ/RuqB3wz9xE3CAruJ3K20lv5N624OPhmp594HksxKKpwNjqLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733136222; c=relaxed/simple;
	bh=D1Xb1QcR/XBJS3+TM12PA+WeFGWDsefCc26dRFAt9gY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q+WiX1I+dVq9YsB4dwfekeP+xe6SjqUTWZwi5T4DwkkPCnANn958tXYsOtjWseSF6VJOg0/lPi8JDL7HBEV4DE7wrdRl+a0Ruv3G9HWrt5JctIHxTpHD7PUpdRgwWjYPV0skVMKCT7+tGkEMKUp8r5wLikKUkb12R/SY/SDy8+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WxcgSbQa; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5cece886771so7262187a12.0
        for <linux-doc@vger.kernel.org>; Mon, 02 Dec 2024 02:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733136218; x=1733741018; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f8Sh0q/GQFE9arwOX9yqCsOKxBmvjNytAYhBr3Emq1U=;
        b=WxcgSbQaA/SwwY/4xG1L68+erACXwDtNVtkwYpTH8ZdqttmQaJkFfZragmtXknFl9A
         CyoE47Ko4SjvmBx/3zv94LkFX2bsVLXRCLVI1z8xJzmMIo3Ks7BPjd5yu8rSKbwprH7Z
         ZOQw2I4b0J2r3MUp8IF5+Y0lDWyPMmT5JqCxaK8jQlA+pKftw4rty0hsZN/rwrcg6cyU
         VH24XE2Adwb/D4N3qmzXVYm6pHClFQHzw/CGIGq/AO5tTTQWQNhx+y9EtxIsiyc6+06h
         dldLJVUIeTdk9S3vhBxTuAHsDbe8C+mMVX6VkSEf3zTdra1Qlzu/zGa+vYGGjFGbHLtb
         FJyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733136218; x=1733741018;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f8Sh0q/GQFE9arwOX9yqCsOKxBmvjNytAYhBr3Emq1U=;
        b=tyFtNG1XTztiVPuivyatDZPX1uMNI+0S3sqzMK4uWZKGfjWiDwy2wT3g+C88ekQT5Z
         PqcOrZcdMmvvMCAK4pAZEDidH+5IT02mAkpHqpqAfeJyGKP5vKtSq3TNeXSyFcdOw5k2
         KoUbUiI0ZVNIZvwzGOsBRZfcSemwKtHTtDwtTtYkqUIEpZTLvnM7QnyFMBcomNgcVaDD
         jrPA6WCuCnqTttypDFNYuMDA7kd2fHfZDCZ27srYfF8l3hS8LTIWlNAW1TouvYHDFJL+
         jmTktaF6hpvEkoFA6JhNF03zUSMQmmgzJV9ZIw8WUJHjFUTDs+1V7xPfmpxwyWTVY4h+
         iZOw==
X-Forwarded-Encrypted: i=1; AJvYcCUogWMXoIszU3W0MdYu6XG/HUdmcROUReRFdYT73rX7FHswsEe9t6YErqrrQQQxffojvHXQAWC9hC8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPJfC7PmgJNjE9sJ5ivpQ8vApYTjlFoZjbwsaAIdwvya5F4DfG
	y88YebJtrhurRFr/ZijL4TRYYPvCisA2kXjmeDZWwcuvOwZ1WZW4W1QeXN3TgFqPUbVf7O4ZV3x
	NrXXcjFtZrutAKJ/F5Ptl150hNfacxBHxz5To
X-Gm-Gg: ASbGnct7LP2p8iij6Xkdt8B5MEa6/gMMk0Z1X1WqVwbWXBWmyMwuzqGD7IPz319s3Wr
	GW7ch+blm+Qev0ECMOa6IOhtWo30zNthOZrzU+c4icvqVYIGi6GOIpyH8PLDiCQ==
X-Google-Smtp-Source: AGHT+IFKNO4MbpB3sDPd+fs66zOrZPRb2J0kApArwNCFfiKch+r4Aue0gc/uO3Aby4JitvWUp2wGWcT14AAJEZOWXTE=
X-Received: by 2002:a05:6402:35d5:b0:5d0:b51c:8483 with SMTP id
 4fb4d7f45d1cf-5d0b51c8732mr12359561a12.16.1733136217716; Mon, 02 Dec 2024
 02:43:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1730244116.git.babu.moger@amd.com> <265f3700ac0c0d33703806fdc3d096b08c992efc.1730244116.git.babu.moger@amd.com>
 <0dc08082-0f3f-4acc-9285-b925a4ce3b02@intel.com> <5d426af4-a947-4115-b7b7-4eeecfa13fec@amd.com>
 <c587f94a-7920-49cf-94b1-4c52140db914@intel.com> <ef92f1fb-086c-4ee1-b8ec-e08ed68f963a@amd.com>
 <e065b193-dbcc-451b-98db-68a5a69e6ae0@intel.com> <20959b58-a882-4ef7-bd11-e8bb0a998945@amd.com>
 <1a93f4e3-d3d2-4764-90d1-728b9cb70481@intel.com> <36d8fe9f-0000-4d0d-a097-efddc3881a2a@amd.com>
 <5aa7924d-b27d-4ee6-b8dd-4bae0e25267b@intel.com> <CALPaoCj+zWq1vkHVbXYP0znJbe6Ke3PXPWjtri5AFgD9cQDCUg@mail.gmail.com>
 <4bf82744-da09-43c3-b8f1-7fc203d1c1c3@amd.com> <CALPaoCjL6FEmVgX-h3_GQEVZNAT3FcH34t9o1PwbUacVzXjZPg@mail.gmail.com>
 <18adb251-b340-4820-a808-e1583b44480a@amd.com>
In-Reply-To: <18adb251-b340-4820-a808-e1583b44480a@amd.com>
From: Peter Newman <peternewman@google.com>
Date: Mon, 2 Dec 2024 11:43:26 +0100
Message-ID: <CALPaoCjvpp3eKKV9L_UJ5Axp1u8XBDtgsuHrhOJhmDrFVphrzA@mail.gmail.com>
Subject: Re: [PATCH v9 14/26] x86/resctrl: Introduce interface to display
 number of free counters
To: babu.moger@amd.com
Cc: Reinette Chatre <reinette.chatre@intel.com>, corbet@lwn.net, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, 
	fenghua.yu@intel.com, x86@kernel.org, hpa@zytor.com, thuth@redhat.com, 
	paulmck@kernel.org, rostedt@goodmis.org, akpm@linux-foundation.org, 
	xiongwei.song@windriver.com, pawan.kumar.gupta@linux.intel.com, 
	daniel.sneddon@linux.intel.com, perry.yuan@amd.com, sandipan.das@amd.com, 
	kai.huang@intel.com, xiaoyao.li@intel.com, seanjc@google.com, 
	jithu.joseph@intel.com, brijesh.singh@amd.com, xin3.li@intel.com, 
	ebiggers@google.com, andrew.cooper3@citrix.com, mario.limonciello@amd.com, 
	james.morse@arm.com, tan.shaopeng@fujitsu.com, tony.luck@intel.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	maciej.wieczor-retman@intel.com, eranian@google.com, jpoimboe@kernel.org, 
	thomas.lendacky@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Babu,

On Fri, Nov 29, 2024 at 6:06=E2=80=AFPM Moger, Babu <bmoger@amd.com> wrote:
>
> Hi Peter, Reinette,
>
> On 11/29/2024 3:59 AM, Peter Newman wrote:
> > Hi Babu,
> >
> > On Thu, Nov 28, 2024 at 8:35=E2=80=AFPM Moger, Babu <bmoger@amd.com> wr=
ote:
> >>
> >> Hi Peter,
> >>
> >> On 11/28/2024 5:10 AM, Peter Newman wrote:

> >>> In my prototype, I allocated a counter id-indexed array to each
> >>> monitoring domain structure for tracking the counter allocations,
> >>> because the hardware counters are all domain-scoped. That way the
> >>> tracking data goes away when the hardware does.
> >>>
> >>> I was focused on allowing all pending counter updates to a domain
> >>> resulting from a single mbm_assign_control write to be batched and
> >>> processed in a single IPI, so I structured the counter tracker
> >>> something like this:
> >>
> >> Not sure what you meant here. How are you batching two IPIs for two do=
mains?
> >>
> >> #echo "//0=3Dt;1=3Dt" > /sys/fs/resctrl/info/L3_MON/mbm_assign_control
> >>
> >> This is still a single write. Two IPIs are sent separately, one for ea=
ch
> >> domain.
> >>
> >> Are you doing something different?
> >
> > I said "all pending counter updates to a domain", whereby I meant
> > targeting a single domain.
> >
> > Depending on the CPU of the caller, your example write requires 1 or 2 =
IPIs.
> >
> > What is important is that the following write also requires 1 or 2 IPIs=
:
> >
> > (assuming /sys/fs/resctrl/mon_groups/[g1-g31] exist, line breaks added
> > for readability)
> >
> > echo $'//0=3Dt;1=3Dt\n
> > /g1/0=3Dt;1=3Dt\n
> > /g2/0=3Dt;1=3Dt\n
> > /g3/0=3Dt;1=3Dt\n
> > /g4/0=3Dt;1=3Dt\n
> > /g5/0=3Dt;1=3Dt\n
> > /g6/0=3Dt;1=3Dt\n
> > /g7/0=3Dt;1=3Dt\n
> > /g8/0=3Dt;1=3Dt\n
> > /g9/0=3Dt;1=3Dt\n
> > /g10/0=3Dt;1=3Dt\n
> > /g11/0=3Dt;1=3Dt\n
> > /g12/0=3Dt;1=3Dt\n
> > /g13/0=3Dt;1=3Dt\n
> > /g14/0=3Dt;1=3Dt\n
> > /g15/0=3Dt;1=3Dt\n
> > /g16/0=3Dt;1=3Dt\n
> > /g17/0=3Dt;1=3Dt\n
> > /g18/0=3Dt;1=3Dt\n
> > /g19/0=3Dt;1=3Dt\n
> > /g20/0=3Dt;1=3Dt\n
> > /g21/0=3Dt;1=3Dt\n
> > /g22/0=3Dt;1=3Dt\n
> > /g23/0=3Dt;1=3Dt\n
> > /g24/0=3Dt;1=3Dt\n
> > /g25/0=3Dt;1=3Dt\n
> > /g26/0=3Dt;1=3Dt\n
> > /g27/0=3Dt;1=3Dt\n
> > /g28/0=3Dt;1=3Dt\n
> > /g29/0=3Dt;1=3Dt\n
> > /g30/0=3Dt;1=3Dt\n
> > /g31/0=3Dt;1=3Dt\n'
> >
> > My ultimate goal is for a thread bound to a particular domain to be
> > able to unassign and reassign the local domain's 32 counters in a
> > single write() with no IPIs at all. And when IPIs are required, then
> > no more than one per domain, regardless of the number of groups
> > updated.
> >
>
> Yes. I think I got the idea. Thanks.
>
> >
> >>
> >>>
> >>> struct resctrl_monitor_cfg {
> >>>       int closid;
> >>>       int rmid;
> >>>       int evtid;
> >>>       bool dirty;
> >>> };
> >>>
> >>> This mirrors the info needed in whatever register configures the
> >>> counter, plus a dirty flag to skip over the ones that don't need to b=
e
> >>> updated.
> >>
> >> This is what my understanding of your implementation.
> >>
> >> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
> >> index d94abba1c716..9cebf065cc97 100644
> >> --- a/include/linux/resctrl.h
> >> +++ b/include/linux/resctrl.h
> >> @@ -94,6 +94,13 @@ struct rdt_ctrl_domain {
> >>           u32                             *mbps_val;
> >>    };
> >>
> >> +struct resctrl_monitor_cfg {
> >> +    int closid;
> >> +    int rmid;
> >> +    int evtid;
> >> +    bool dirty;
> >> +};
> >> +
> >>    /**
> >>     * struct rdt_mon_domain - group of CPUs sharing a resctrl monitor
> >> resource
> >>     * @hdr:               common header for different domain types
> >> @@ -116,6 +123,7 @@ struct rdt_mon_domain {
> >>           struct delayed_work             cqm_limbo;
> >>           int                             mbm_work_cpu;
> >>           int                             cqm_work_cpu;
> >> +     /* Allocate num_mbm_cntrs entries in each domain */
> >> +       struct resctrl_monitor_cfg      *mon_cfg;
> >>    };
> >>
> >>
> >> When a user requests an assignment for total event to the default grou=
p
> >> for domain 0, you go search in rdt_mon_domain(dom 0) for empty mon_cfg
> >> entry.
> >>
> >> If there is an empty entry, then use that entry for assignment and
> >> update closid, rmid, evtid and dirty =3D 1. We can get all these
> >> information from default group here.
> >>
> >> Does this make sense?
> >
> > Yes, sounds correct.
>
> I will probably add cntr_id in resctrl_monitor_cfg structure and
> initialize during the allocation. And rename the field 'dirty' to
> 'active'(or something similar) to hold the assign state for that entry.
> That way we have all the information required for assignment at one
> place. We don't need to update the rdtgroup structure.

It concerns me that you want to say "active" instead of "dirty". What
I'm proposing is a write-back cache of the config values so that a
series of remote updates to many groups can be written back to
hardware all at once.

Therefore we want to track which entries are "dirty", implying that
they differ from what was last written to the registers and therefore
need to be flushed by the remote domain. Whether the counter is
enabled or not is already implicit in the configuration values (evtid
!=3D 0).

-Peter

