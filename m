Return-Path: <linux-doc+bounces-16603-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A56808CA068
	for <lists+linux-doc@lfdr.de>; Mon, 20 May 2024 18:00:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C72001C20D77
	for <lists+linux-doc@lfdr.de>; Mon, 20 May 2024 16:00:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9837F136E03;
	Mon, 20 May 2024 16:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="b1AeUqz0"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285A0F9C9
	for <linux-doc@vger.kernel.org>; Mon, 20 May 2024 16:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716220835; cv=none; b=sXHTekowxRVl6PIY5u91nQarN1P3aey/aY1cu7KvJfXSfeRhk7qK7LdlrYsQT6oNtpYB1jlHNOXNVFnXEwmZjlqpwCjFgGm4/ZGZm/9u4cVfBAbxT//ogKKXsEEpzlWh1Gj3vcqjmd0jkl/OQuHsAGKopAOszjKcUJQHpbCKHhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716220835; c=relaxed/simple;
	bh=74OgddEij1CdKOr7nsQpcxRgDTjS/dIJGQiYkK7+pOo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AatEX+yIz5xS+zLkDrIQu65/FFG6J75Jen0HMzmp+cO1X4lz5aXhnFAvzkPmCTNUWnzTamlArgW1rYrpMeZu36rO+JGiqVKhRU9Ky2GDDXU7eOhu1BKvwZS+rhpjnWMDyhMSfWJqMYGxlRCAC522/KGmZOn1UxEOgTCz58H+v4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=b1AeUqz0; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1eed90a926fso212785ad.0
        for <linux-doc@vger.kernel.org>; Mon, 20 May 2024 09:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716220833; x=1716825633; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=74OgddEij1CdKOr7nsQpcxRgDTjS/dIJGQiYkK7+pOo=;
        b=b1AeUqz02OpA8o9wkiSz8IlCJRicor/iyim0+DI9RavFz/r3c6gGcw3YFSqMthTVcZ
         /CSK7CknBtkwjq0gpxxJmeZ8+KDkKREdX1Jv34I7C/VHCT0OQODnuQh0SGTGM9aHq3M2
         wKFErOB6eGhaze6q/ZNBao1YrsROmLfP4zkglxKhu34uHsCja9GATPUdDuwdjgU8sXkM
         zZJQxFuTysJLbpGNLbRp60PT4fMI03HbdSrhwNYYkoaBtLOBn9lcn9Aw/s1M9Fj3IM1t
         +j+a7AhRZXFQ0CbOxPptYiYySlqnK2AiOTqmDRLhPNCOaB2TzFNB4G2OFw2P2/p/Xlcm
         V98A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716220833; x=1716825633;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=74OgddEij1CdKOr7nsQpcxRgDTjS/dIJGQiYkK7+pOo=;
        b=ME3CB/sCSZotj2wai3cr3e1MWvLUtEvUZgXib7iSjqLu8FymRxpxz8m9YGM05P8fOF
         8hOQUO53a1P/ixEk7NsltvFef8XlnAMayniVweQGZ4v6aNFkQ3WRXyWWOBWcfluWhREU
         QPY3V/Mhsl38906/7FD8/+xQnUIJ3ieK8u3aB5lMJZZi1FlutuMfUvl9s+xd0XUk6I5f
         Zpva2xUzhwSTQ73a0V3yOEAXoJOokZ5CF7QvLDidPmJTHU4gxLda+pFLZ8KKCo0t501G
         W4Z5nRhlP++wmdTZN+QN4vCXDrG7IUYG/2aujBQZ9eTGfnXGCMJo6Xun0yGaKKMC/e/E
         TAdg==
X-Forwarded-Encrypted: i=1; AJvYcCVbnpU4cjZXpK9pfbmlr/O8C0ZxHiwh8OjOW3oyQxsrYBMkGjchdn+bCmeazgJ2ull2rHlr9oqkDTssYZYTl04ScdAJAxHoRMkY
X-Gm-Message-State: AOJu0YxHYn/BoPeqaF6DwQbGx6PxeC0fOWC0RRbUtI9JmlvPysGGe/8j
	U9E+TvfhN0psN2ogTq3oxIEHGzyonPMMBqLnUv7m9rE5fCWU+fo7N2KFV/5lsIXvegbtWszEepY
	AnNzJY9LwqGLRXWOWWAAXg2xVlHPwcuGai7vf
X-Google-Smtp-Source: AGHT+IGpRekdWyemBibjacSQMYbn6i1xsrzO7dlG3bkZXaNFXd2FbNWPC+rVxr8FPQRubhli1F/P3H93KAkTNF16b04=
X-Received: by 2002:a17:902:c395:b0:1e2:1955:1b1c with SMTP id
 d9443c01a7336-1f2ee0ec936mr3283225ad.27.1716220832548; Mon, 20 May 2024
 09:00:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1711674410.git.babu.moger@amd.com> <CALPaoCjZ3oLdKymJjASt0aqtd0GGOme7LavvYOtPYTb_rA-mYQ@mail.gmail.com>
 <b35dc4e9-7e8b-42ed-9a51-ae50d521cf4b@amd.com> <CALPaoChxYoJx8eR48EkSKf-hu2p2myQJLZEhj_Pq6O4R15-=5A@mail.gmail.com>
 <6edffe1b-e9a9-4995-8172-353efc189666@amd.com> <ab2a6a4b-3740-47c6-9443-e6bb7a0c1adb@intel.com>
 <CALPaoCiYFKeASPMDwzzaHLw4JiMtBB6DTyVPgt0Voe3c3Tav_A@mail.gmail.com>
 <b725e4ca-8602-eb26-9d47-914526621f52@amd.com> <CALPaoCiu2_UHyGjsyitz28BL1N93TSn28E1r-6nhXg--bzmU+Q@mail.gmail.com>
 <d7f3c5b1-c39d-4c66-92c3-5b096b9e0579@intel.com> <CALPaoCiJ9ELXkij-zsAhxC1hx8UUR+KMPJH6i8c8AT6_mtXs+Q@mail.gmail.com>
 <fae7fd93-27b7-4f94-964b-9c909f85f2fe@amd.com>
In-Reply-To: <fae7fd93-27b7-4f94-964b-9c909f85f2fe@amd.com>
From: Peter Newman <peternewman@google.com>
Date: Mon, 20 May 2024 09:00:19 -0700
Message-ID: <CALPaoCihfQ9VtLYzyHB9-PsQzXLc06BW8bzhBXwj9-i+Q8RVFQ@mail.gmail.com>
Subject: Re: [RFC PATCH v3 00/17] x86/resctrl : Support AMD Assignable
 Bandwidth Monitoring Counters (ABMC)
To: babu.moger@amd.com
Cc: Reinette Chatre <reinette.chatre@intel.com>, corbet@lwn.net, fenghua.yu@intel.com, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	paulmck@kernel.org, rdunlap@infradead.org, tj@kernel.org, 
	peterz@infradead.org, yanjiewtw@gmail.com, kim.phillips@amd.com, 
	lukas.bulwahn@gmail.com, seanjc@google.com, jmattson@google.com, 
	leitao@debian.org, jpoimboe@kernel.org, rick.p.edgecombe@intel.com, 
	kirill.shutemov@linux.intel.com, jithu.joseph@intel.com, kai.huang@intel.com, 
	kan.liang@linux.intel.com, daniel.sneddon@linux.intel.com, 
	pbonzini@redhat.com, sandipan.das@amd.com, ilpo.jarvinen@linux.intel.com, 
	maciej.wieczor-retman@intel.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, eranian@google.com, james.morse@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Babu,

On Mon, May 20, 2024 at 7:25=E2=80=AFAM Moger, Babu <babu.moger@amd.com> wr=
ote:
>
> Hi Peter,
>
> On 5/17/24 16:51, Peter Newman wrote:
> > Hi Reinette, Babu,
> >
> > On Fri, May 3, 2024 at 2:15=E2=80=AFPM Reinette Chatre
> > <reinette.chatre@intel.com> wrote:
> >>
> >> Hi Peter,
> >>
> >> On 5/3/2024 2:00 PM, Peter Newman wrote:
> >>> Hi Babu,
> >>>
> >>> On Fri, May 3, 2024 at 1:44=E2=80=AFPM Moger, Babu <bmoger@amd.com> w=
rote:
> >>>>
> >>>> Hi Peter,
> >>>>
> >>>> On 5/2/2024 7:57 PM, Peter Newman wrote:
> >>>>> Hi Reinette,
> >>>>>
> >>>>> On Thu, May 2, 2024 at 4:21=E2=80=AFPM Reinette Chatre
> >>>>>> I do think ABMC should be enabled by default when available and it=
 looks
> >>>>>> to be what this series aims to do [1]. The way I reason about this=
 is
> >>>>>> that legacy user space gets more reliable monitoring behavior with=
out
> >>>>>> needing to change behavior.
> >>>>>
> >>>>> I don't like that for a monitor assignment-aware user, following th=
e
> >>>>> creation of new monitoring groups, there will be less monitors
> >>>>> available for assignment. If the user wants precise control over wh=
ere
> >>>>> monitors are allocated, they would need to manually unassign the
> >>>>> automatically-assigned monitor after creating new groups.
> >>>>>
> >>>>> It's an annoyance, but I'm not sure if it would break any realistic
> >>>>> usage model. Maybe if the monitoring agent operates independently o=
f
> >>>>
> >>>> Yes. Its annoyance.
> >>>>
> >>>> But if you think about it, normal users don't create too many groups=
.
> >>>> They wont have to worry about assign/unassign headache if we enable
> >>>> monitor assignment automatically. Also there is pqos tool which uses
> >>>> this interface. It does not have to know about assign/unassign stuff=
.
> >>>
> >>> Thinking about this again, I don't think it's much of a concern
> >>> because the automatic assignment on mongroup creation behavior can be
> >>> trivially disabled using a boolean flag.
> >>
> >> This could be a config option.
> >
> > I'd like to work out the details of this option.
> >
> > info/L3_MON/mbm_assign_on_mkdir?
> >
> > boolean (parsed with kstrtobool()), defaulting to true?
>
> I am thinking is not a big concern. We only have limited (32) counters.
> Automatic monitor assignment works only for first 16 groups(2 counters fo=
r
> each group). When the counters are exhausted auto assignment does not
> work. In your case(with more than 16 groups) the auto assignment does not
> work. I feel having a config option is really not necessary.

I'm not sure I follow the argument you're trying to make because it
doesn't sound like an argument against adding a config option. What
exactly do you mean by "work" vs "not work"?

Also it doesn't address my original concern about needing to manually
(and non-atomically) undo the auto assignment in order to account for
where the monitors are assigned or ensure that creating a new
monitoring group will succeed.

-Peter

