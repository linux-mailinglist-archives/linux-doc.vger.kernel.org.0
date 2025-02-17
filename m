Return-Path: <linux-doc+bounces-38304-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF64A38025
	for <lists+linux-doc@lfdr.de>; Mon, 17 Feb 2025 11:29:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B1BEA1886A7E
	for <lists+linux-doc@lfdr.de>; Mon, 17 Feb 2025 10:27:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F4E2215F75;
	Mon, 17 Feb 2025 10:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ojEc8Eh3"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83ADF155321
	for <linux-doc@vger.kernel.org>; Mon, 17 Feb 2025 10:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739788025; cv=none; b=X0+T+tEIYrAAFWeT+zrW8QjmvazvvRPOjgKxGtZioLabnDpuwbmMAfLqEw/QdVQc7fxaz6eC+YymeFH/yOWzm9sP4e11uvboeU49wjQ/YyaWnVLwzvg/N0LsSVk1USUgIlsdKdmRzxvhZBWb+bpA5bToTFEWnc23Z11uBNUtwDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739788025; c=relaxed/simple;
	bh=9k3Ley5on6cNS3Um6E7fX7FSbKjsfoF3+qaejyNgr8E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Av9IhPTl6wpfieR9JR5snusokWr4lHWGQAYSpqCa1EqGOsT6ArLiFGsQ8T75i/T3tFklY62tYSMNgXDtRBfyfFHmb1CE5H/QLRKpGKpcPX+Wi5gyrfacIeiXltUsCZ4iE9vg9jwd4TYyTR87FsgOpquQm3J8FMqZ3zaGu5tOQSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ojEc8Eh3; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aaec61d0f65so869955366b.1
        for <linux-doc@vger.kernel.org>; Mon, 17 Feb 2025 02:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739788022; x=1740392822; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9k3Ley5on6cNS3Um6E7fX7FSbKjsfoF3+qaejyNgr8E=;
        b=ojEc8Eh3sW9bRQsx7XVj8s74mPFoVsBbPj8bMb9Nb8LznBcXe/l4E03YzsLDfIP5Ok
         moE6QykfPVp/7T+7bZombbz7QaZRUKuu6vk89cRSFtHL1alJPcMTmWV2zvjnHdU5l1pk
         glsAZNb3rw9T5jlv59kt7WEVzPh60iEh8sIWyA3I6BKuQcV/rTNfXo4WxMYS8WrO/IES
         d7rPou/f4S7GEKMqcMHQ85fJkmdyG0ev78iczSSYMP1GpTSIcFx/Z0RXfrwPW1h2Yq7P
         3NQx2z2voNYpiyuDEtQbR9I08QBOPw6H17domXG+BuxXw9zYD/ro2QDpQ5MLNcfqEPWT
         EXgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739788022; x=1740392822;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9k3Ley5on6cNS3Um6E7fX7FSbKjsfoF3+qaejyNgr8E=;
        b=vwhtPA6NT285H0kSIdVaAVF8tgitFUm/ToogPy/bTtoesidQUhJxsjRu8Om9tOvJeS
         JMcu5mp6WOJ6B8rcKNZMpYPeETZl/pMnX5az26aNTDtGWMAkdF0dCMhFMGKJ/yjGge2J
         YpaUyHcpEmqxZb5wXqLEcTdyBaXGnyHtJvfQ4wDCiKitUtc8RFKmuXso/LH472Ds+hgr
         TkJFsPQnPbrkGBD16uwNLjzM2uGEE+ATVBH9pEDUEbyTyB4SfC5TiLINxspzYR3YTGF5
         MUTCQI2AnOYl+wS8/+VPTg4dnK6As/VG25b+45anuTszS8zoMHCVULtPFm0z1N7Uor2q
         uLRA==
X-Forwarded-Encrypted: i=1; AJvYcCW3710g3X6ks2jV5W8m628OaNzzgefN3HsU9wizY64by4F9TMJibYmMrJFuYrbn7UwvbE2r3v49IRY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCo4nEY1WLj8poHcZfkYKxRZXXKtYU6Pd9Ua4Xd4Zj0hsvPz2z
	4Jll/9BuBpGEwIOerRhwyL20PJauR/GCnS3uOeAZpJJreQaIlRLveq6y+6EPSCI9jK/9fClQS8w
	GhuL0seMOvjDsdssuuqmwSxGcL0NZxldNnPuV
X-Gm-Gg: ASbGncsriLttct12QRAF/WRIAUopMgcuCAGM/H3lfItuiPQ6tCjhsEiNWvOrrsuwFP6
	dhYIXX20OZOjBQ5eTJDf/v8EVGNICNg12lKOJWPDm383EEUgnH3hRvK6QfaX/wjMJLxTCcckQ/E
	0kGI0DBtmi3qfxG6Pys2mXIwNFU4g=
X-Google-Smtp-Source: AGHT+IGg1IvKUUc/p89hI5JmJHNwGjCIidYUwflNrBdFIe9/jBuy8aomXpodWq0ngM1ox2M+sGMDDJ33W91g3uOhF/M=
X-Received: by 2002:a17:907:9494:b0:aba:6385:b46d with SMTP id
 a640c23a62f3a-abb711c8145mr868876766b.50.1739788021652; Mon, 17 Feb 2025
 02:27:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1737577229.git.babu.moger@amd.com> <Z6zeXby8ajh0ax6i@e133380.arm.com>
 <9e849476-7c4b-478b-bd2a-185024def3a3@intel.com> <Z64tw2NbJXbKpLrH@e133380.arm.com>
 <76b02daf-1b45-473e-9d75-5988a11c6887@intel.com> <8ef51f28-e01a-4a7d-ba86-059437edb60b@amd.com>
 <a07fca4c-c8fa-41a6-b126-59815b9a58f9@intel.com>
In-Reply-To: <a07fca4c-c8fa-41a6-b126-59815b9a58f9@intel.com>
From: Peter Newman <peternewman@google.com>
Date: Mon, 17 Feb 2025 11:26:50 +0100
X-Gm-Features: AWEUYZkJWWlGFJQHM3ION9s69WbN6z7O8hPgk5lTi1q7GZyVgca9f_VULlmwWfM
Message-ID: <CALPaoCh7WpohzpXhSAbumjSZBv1_+1bXON7_V1pwG4bdEBr52Q@mail.gmail.com>
Subject: Re: [PATCH v11 00/23] x86/resctrl : Support AMD Assignable Bandwidth
 Monitoring Counters (ABMC)
To: Reinette Chatre <reinette.chatre@intel.com>
Cc: "Moger, Babu" <bmoger@amd.com>, Dave Martin <Dave.Martin@arm.com>, Babu Moger <babu.moger@amd.com>, 
	corbet@lwn.net, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, tony.luck@intel.com, x86@kernel.org, 
	hpa@zytor.com, paulmck@kernel.org, akpm@linux-foundation.org, 
	thuth@redhat.com, rostedt@goodmis.org, xiongwei.song@windriver.com, 
	pawan.kumar.gupta@linux.intel.com, daniel.sneddon@linux.intel.com, 
	jpoimboe@kernel.org, perry.yuan@amd.com, sandipan.das@amd.com, 
	kai.huang@intel.com, xiaoyao.li@intel.com, seanjc@google.com, 
	xin3.li@intel.com, andrew.cooper3@citrix.com, ebiggers@google.com, 
	mario.limonciello@amd.com, james.morse@arm.com, tan.shaopeng@fujitsu.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	maciej.wieczor-retman@intel.com, eranian@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Reinette,

On Fri, Feb 14, 2025 at 8:18=E2=80=AFPM Reinette Chatre
<reinette.chatre@intel.com> wrote:
>
> Hi Babu,
>
> On 2/14/25 10:31 AM, Moger, Babu wrote:
> > On 2/14/2025 12:26 AM, Reinette Chatre wrote:
> >> On 2/13/25 9:37 AM, Dave Martin wrote:
> >>> On Wed, Feb 12, 2025 at 03:33:31PM -0800, Reinette Chatre wrote:
> >>>> On 2/12/25 9:46 AM, Dave Martin wrote:
> >>>>> On Wed, Jan 22, 2025 at 02:20:08PM -0600, Babu Moger wrote:
>
> (quoting relevant parts with goal to focus discussion on new possible syn=
tax)
>
> >>>> I see the support for MPAM events distinct from the support of assig=
nable counters.
> >>>> Once the MPAM events are sorted, I think that they can be assigned w=
ith existing interface.
> >>>> Please help me understand if you see it differently.
> >>>>
> >>>> Doing so would need to come up with alphabetical letters for these e=
vents,
> >>>> which seems to be needed for your proposal also? If we use possible =
flags of:
> >>>>
> >>>> mbm_local_read_bytes a
> >>>> mbm_local_write_bytes b
> >>>>
> >>>> Then mbm_assign_control can be used as:
> >>>> # echo '//0=3Dab;1=3Db' >/sys/fs/resctrl/info/L3_MON/mbm_assign_cont=
rol
> >>>> # cat /sys/fs/resctrl/mon_data/mon_L3_00/mbm_local_read_bytes
> >>>> <value>
> >>>> # cat /sys/fs/resctrl/mon_data/mon_L3_00/mbm_local_bytes
> >>>> <sum of mbm_local_read_bytes and mbm_local_write_bytes>
> >>>>
> >>>> One issue would be when resctrl needs to support more than 26 events=
 (no more flags available),
> >>>> assuming that upper case would be used for "shared" counters (unless=
 this interface is defined
> >>>> differently and only few uppercase letters used for it). Would this =
be too low of a limit?
>
> As mentioned above, one possible issue with existing interface is that
> it is limited to 26 events (assuming only lower case letters are used). T=
he limit
> is low enough to be of concern.

The events which can be monitored by a single counter on ABMC and MPAM
so far are combinable, so 26 counters per group today means it limits
breaking down MBM traffic for each group 26 ways. If a user complained
that a 26-way breakdown of a group's MBM traffic was limiting their
investigation, I would question whether they know what they're looking
for.

-Peter

