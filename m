Return-Path: <linux-doc+bounces-85573-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHZNNQZu92nYhgIAu9opvQ
	(envelope-from <linux-doc+bounces-85573-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 03 May 2026 17:47:18 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E1F4B64E8
	for <lists+linux-doc@lfdr.de>; Sun, 03 May 2026 17:47:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A38E3300DDC8
	for <lists+linux-doc@lfdr.de>; Sun,  3 May 2026 15:45:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EE013932F9;
	Sun,  3 May 2026 15:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PbUp13MG"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C79392C34
	for <linux-doc@vger.kernel.org>; Sun,  3 May 2026 15:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777823157; cv=pass; b=FA1t4tELXfB2bZTD1HngTwvulPpIU24jVD5n2Jryv50C1CL65ZByyPa1X8F7cpksozYfJkUqbpFPWHu1IfjzRQp/T4R0yBO+w15TI2QEXisIMeWbat2P1tw602ftrm96PxyjgWZQbFji3qgpH4kZV4WKdxpLiMRnfJOAAKcQrAU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777823157; c=relaxed/simple;
	bh=AfKocqKNeZFilYkSDZELpeX9XJN2xfuH/zaBNoBL+vs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s0RB7KL0wx/wyfHWLyxKddnkSUDYZpDGao3vDUXvC5T9zGRMx6FSXew1RpJJLqnaU/+03irqqAS2KBlEt5FCANtNSVA9ZQwuxHAlz/JmgNxfnpHE6U6TfuicvsSxEL+GaepsXTih3FaDCAskB2QSATWvD6mEwUCkAMXt3cgQ9lc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PbUp13MG; arc=pass smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7de4a9cb8eeso3000678a34.0
        for <linux-doc@vger.kernel.org>; Sun, 03 May 2026 08:45:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777823155; cv=none;
        d=google.com; s=arc-20240605;
        b=Z63gVTkro2ntilnkek0RIa07pPD3w4T6nID+biVscyfh5SPpsA17XBDgasx9IbVik/
         5pbclUygYf/qUEzRx054wa8pJyE3Sk2WXOYIaETCwNvpUd6gGjUCGDewzJS7EkXIS1ii
         dB6Nk6Yg7LD1xU1XnCNW9t85klqX4g3L2N/Zm6YlXoRJIByULugElQzsqW0HbA2G/rvV
         sOSmM8x4qwQDfbqnMMTqme8XcRRd/P+ExxjFUFiael10OfAHdXdbbzE3gO1wysLqNzPZ
         SNtDmtP9M6jbBSuVrnYXzsMgeT6WaRebJl4hsvLMoc1kmDjwGfoNUQp788I6wNXl9x6c
         HDSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bIQ7SeUkUvKo31cS3DWqMoDRHM/EMTcPv+98ocN8jws=;
        fh=CvAoNJxu24rG0D2SJaE2994iI9FE2xtVN6/18KyIvjo=;
        b=kwD88nm+CfkLhozJwN5jksYjsXAsYQANkQFGtg0I3OcLDdhttR2CNsTdnAYgMa6oI1
         EJ1gHg3Aoa6+/Xtx7eoWRQyUITlo4uRsq8TSDCuFUOsNeoRcH9Vm1w3+pcttH8uiLFH8
         e2YWQ4+7fv4Hm1geKOpYY1qrTUTn7pFgIUA7dvU0UqWlKDfwRx3pFxNozHqxvpc+fo/t
         Gn5MDB+UpKzFwNZDkXTPdjVjlL1rM43uplvFkXhzJflzpXpBX6x+SkYaN8ESzruhvPrW
         bLYR3CIK+Ly/sztLDUn3TFRv+CMwfTxNqTJ958Ie4OBsi65DTHnNinbvgSIxLVsDfCth
         UOVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777823155; x=1778427955; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bIQ7SeUkUvKo31cS3DWqMoDRHM/EMTcPv+98ocN8jws=;
        b=PbUp13MGnm5EL2/xWH8r0yuuufWyzGkRmAfqfuySQYWgt+N5KCEzZRayOedauvg9DX
         I+9FnRO/9ZBdPMOvrcjTCqtcOcTFx7I0ZrAGBHN3XSw/hyHrWPFPH52Xz9d4m3s3EKAW
         s+jHgT2ba+udYKMrqIreAC1gi6rdchpMugMosdLEtZe6pAwG/5Fnbdm3z9BDSZSkjcL0
         walkBjiEVJ6Hvf1qmPdctWJDARMahF69d3/8vSTwCpMa+q4SJtQMw7L0YZErHYLZtqsc
         jxKkg3IUNSkYkB2j/4kkJbBTzJQp7eYDBAlb9ohaMmFcjP16QiiXnnFXxELSeAzYQyKG
         5vpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777823155; x=1778427955;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bIQ7SeUkUvKo31cS3DWqMoDRHM/EMTcPv+98ocN8jws=;
        b=Da3MZWZsclnYDrkZ5MCEJtM50VUkMyOjYVy8QpW+uyXgK4FjJxaCwphvgYmKt+0br7
         Y2k4qt2KlfWH/2nPTbtsmY5emyJJ+RQR0ujCSTtwSUF0QvMjG26KFm78txpKXdgCsprt
         MWNGnEuzTML3DAd4Mc+A2xhKvBf/D1rpcL83+kuGo2Z418JP86yIbG+uWpoZK96meY/f
         RQ14t2jKROWZdVa7naczg0s+JOt7HD4f+9zlllTKeK0GW7ItldUDWy+r3VrV6WauzC1X
         4D45+46jpd57y8lK8g7Oo/Y41f8gKXw1oYzUCVDLGx4ARN754HnnnGAVru+xu1kWY3vG
         Cbng==
X-Gm-Message-State: AOJu0YzYLE23HvIyvlk5fguQk5jhJ265e5rWhl1igxeLmtMA6p2c02eL
	wXrHL2hIW39UCo/Pi93OBKqAZ1SgTksmG5XehVG46VlnhhmtnZRwP1vHy0VCmzHqCB1Cr40sHEG
	ZL/CEvWL4Dy2vPEKOmAtB/igt6/CF+kTXMWPB
X-Gm-Gg: AeBDietAuI5+pHd9p8BdnrNq5ooHuQVfLc0agomlqaOFFMZugZ/GQxehlL1UuMgvYoi
	CFeZq2Se8jikDahTeMmw5vRDCg7CRMy2hGN1uIt77c8M5YUTWfdwhm/EpJWyC0eD0iZkSDJYXwx
	Ex2J+TPwmWMh5ieM2GnzEPmUg5y9inwca9fhxLgaYX6toBYknku1cAVd1e3dIboccu8vPg2a5y0
	eNhiQodAPNXh9rFSL9sj0ETSL9BQM9tHCKagLZqME0LPSewGZF2OOzuZW8UnogCe298sgBxHJX/
	kLCI9fQnRsslNT479y9mz0BSpA/DLHLps+1YwwoWkLEltJo5ILxpJw9duNHcsWulNfwCsZntA0O
	fQdHllPuq
X-Received: by 2002:a05:6820:1c86:b0:67d:e7c3:3c65 with SMTP id
 006d021491bc7-69697e4038amr3054022eaf.56.1777823154852; Sun, 03 May 2026
 08:45:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428180208.175472-1-danielmaraboo@gmail.com> <87jytkcz1c.fsf@trenco.lwn.net>
In-Reply-To: <87jytkcz1c.fsf@trenco.lwn.net>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Sun, 3 May 2026 12:45:44 -0300
X-Gm-Features: AVHnY4KGAJHkEuEWrEaBvNUVL03o1yE66D3J1dy70kGV8vFj4Q7AvxTeAOKHDPc
Message-ID: <CAMAsx6eiiaBAbrgLFg0Gk6AJEcWgo=0kyEGonC0UDBF8dx6FuQ@mail.gmail.com>
Subject: Re: [PATCH] docs/pt_BR: process: link maintainer-kvm-x86 in maintainer-handbooks
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 53E1F4B64E8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-85573-lists,linux-doc=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[danielmaraboo@gmail.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]

 Jonathan Corbet <corbet@lwn.net> wrote:

>
> >Weird, I wonder why it doesn't warn about this...?  In any
> >case...applied, thanks.
>
> > jon

Hi Jon,

I also found it strange that there was no warning during compilation,
which is why I went ahead and made the adjustment.

Thank you very much!

Best regards,

Daniel Pereira

