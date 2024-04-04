Return-Path: <linux-doc+bounces-13500-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 877C2898D50
	for <lists+linux-doc@lfdr.de>; Thu,  4 Apr 2024 19:36:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B90311C22817
	for <lists+linux-doc@lfdr.de>; Thu,  4 Apr 2024 17:36:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 572008665A;
	Thu,  4 Apr 2024 17:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qvFJ/IdK"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73B51F94D
	for <linux-doc@vger.kernel.org>; Thu,  4 Apr 2024 17:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712252201; cv=none; b=Zg8N65strmKFhcQLTzqbVHXmR2yfsdI3BkXsMgzkkEqPOIYYsP5U/DKplesyU/8/OVS9/G2KddnBDP5mGrjYlHOwTE0cXPszDsxMogEQUsd/6PYXdhSTKL+j/7E7e9qpXoDumaIJJmEu9R2kZHe0G9OfTDGhVZz1+ETJy8YBbuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712252201; c=relaxed/simple;
	bh=zPtPmk4XGACn56oSm28VjAIkdBAQmqYVb7YBpev1rDU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AoGUzoh/2sKfruWrjXf08YzxnNsTlooCwzgEK/tNCYujQ/AG9MnIBHtlfNWf+FEgtw9zIc7cV7XjjIrktTdHxbZqltbYBS6GvhWAwEDNBgaUC6Fl8BoUHT49pYFuuvS/e0MEp+K2yy/nCc3K+UaNDVFbsYrqKdYKzQd7rQ6iiJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qvFJ/IdK; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-431347c6c99so27381cf.0
        for <linux-doc@vger.kernel.org>; Thu, 04 Apr 2024 10:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712252199; x=1712856999; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zPtPmk4XGACn56oSm28VjAIkdBAQmqYVb7YBpev1rDU=;
        b=qvFJ/IdKpyeA9vK9kI448/47w83/GKasbI5y+AUOzBRxf5YlCZei6HSk1M3tVYf0N5
         lSzG1Gq9iSJAeQrPzfXmOY20kkZDTzIowzV5Tj8VwjyIXPPD0uEVEROYXJsyBUYqf3Gk
         4ig1kKWBjMIpM/r+bl3r6TZQHojUQHb93GIzgJULVCvGUS/yjFZXXqWB3uGuvYQzFR0l
         Urqs5W5cXy7R4IB5qklpn2Iss89YGTnF5MvIdUrZy/viwVlfqOw1Tr7oU04lYb6iGNh7
         UoPtXQ1ZlJJaXz+047BlHpmxDxMcYgcssPbo8NdT43mUcqxlocbqdmxeCRvMfa8o0Msv
         tvOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712252199; x=1712856999;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zPtPmk4XGACn56oSm28VjAIkdBAQmqYVb7YBpev1rDU=;
        b=T42xOp4piYuMJMJJCVf6t4q1RxIH1pAWrE8sle/+iPjvBaKhmuZhXoUVBRTABanTZI
         4h35est43gbjfzAFlIBmrU007TePLHjIQbfHaz1DnXUTvFMAjElA59d4liUvdaCJyHpt
         zofURU3h34jKYUj9ZfoMeSXrJ5aazPMd8lerwl2EqnFse5m1iiasaAdB54yQfiMEjKRc
         c0Sr0JvZi3Ud42tHNreuIZ/IQK/vnngZC5BUjyRb+bdPonV/2ZJl4US5zOrAvwr7Zv7L
         617UYVisAxpLlE+la3Oyq+B30OMDigeTDG1aPqzd/yo4lC2CdNcyxM3NLpNYkmgZ3+wP
         CYxg==
X-Forwarded-Encrypted: i=1; AJvYcCXbqFtze2Dx5a0ELmUoDVbS2N7nHHB8ioBb5i0tdIu7vrzxMJfK/+lHtbuZPb/0SRYCCZ2JMWR0V03CDNI4PXal/yXqMVsbnAo9
X-Gm-Message-State: AOJu0YyySnJqse+/GeHbLOG+nRpEp5/oKM4L8MLHpPkPoUQmxIkdZFSG
	8uAOnAMjKDDENlpGpEarp4U8ZzvqmNNEDxMP4IbsQ2t1IFjUHOPEdAgkcYbv9R7kDzeKRUcgEI0
	ZzisV4z1HiRD/SNprsJYxrdC57y1SjZ9KHtfA
X-Google-Smtp-Source: AGHT+IGJGAj67BSxM0ypCASU/q9O6W66vS6NOHkSaJ66ZI0z/UrvwLXhVW+IwuAGMLIwBEadqz10TP5oinsyBT12BK8=
X-Received: by 2002:a05:622a:424f:b0:431:8176:e4e5 with SMTP id
 cq15-20020a05622a424f00b004318176e4e5mr218275qtb.13.1712252198544; Thu, 04
 Apr 2024 10:36:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1711674410.git.babu.moger@amd.com> <0db75c94886da62b8da498ef159d8fe27b0b3811.1711674410.git.babu.moger@amd.com>
 <CALPaoCgRtYLnzpkL6uVjb+LvBbxD8ANRuzACP1UQ=rkzk8TCqg@mail.gmail.com> <a7e7f220-99f2-465f-bc36-aadccb891190@amd.com>
In-Reply-To: <a7e7f220-99f2-465f-bc36-aadccb891190@amd.com>
From: Peter Newman <peternewman@google.com>
Date: Thu, 4 Apr 2024 10:36:27 -0700
Message-ID: <CALPaoChsU-C6fhjfLFEmxCXCdY-0PL-Hk4pHYs=TZ9PN6UFexw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 07/17] x86/resctrl: Add support to enable/disable
 ABMC feature
To: babu.moger@amd.com
Cc: corbet@lwn.net, fenghua.yu@intel.com, reinette.chatre@intel.com, 
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

On Thu, Apr 4, 2024 at 8:16=E2=80=AFAM Moger, Babu <babu.moger@amd.com> wro=
te:

> On 4/3/24 19:30, Peter Newman wrote:
> > This looks like it would move to fs/resctrl/rdtgroup.c where it's not
> > possible to dereference an rdt_hw_resource struct.
> >
> > It might be helpful to try building your changes on top of James's
> > change[1] to get an idea of how this would fit in post-refactoring.
> > I'll stop pointing out inconsistencies with his portability scheme
> > now.
>
> Considering the complexity of James changes, I was hoping my series will
> go first. It would be difficult for me to make changes based on transient
> patch series. I would think it would be best to base the patches based on
> tip/master.

I don't need you to push the patches to the mailing list based on
James's series. I was just asking you to try building locally on top
of the refactoring changes. You are putting in the effort trying to
make this code portable (i.e., inventing new
resctrl_arch_-interfaces), so it would be sensible to check your work
locally.

However, I am the main stakeholder who cares about MPAM and ABMC
working in the same kernel, so I can continue to give feedback on
portability as I compose the series' together.

-Peter

