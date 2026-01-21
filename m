Return-Path: <linux-doc+bounces-73383-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPR2CrqFcGkEYQAAu9opvQ
	(envelope-from <linux-doc+bounces-73383-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 21 Jan 2026 08:52:26 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8831F53125
	for <lists+linux-doc@lfdr.de>; Wed, 21 Jan 2026 08:52:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D5A044FEFF0
	for <lists+linux-doc@lfdr.de>; Wed, 21 Jan 2026 07:51:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECCF6466B4C;
	Wed, 21 Jan 2026 07:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aqdUiR0R"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C7E32ED58
	for <linux-doc@vger.kernel.org>; Wed, 21 Jan 2026 07:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768981907; cv=pass; b=QP0tD3CxyJujNX+z9liuf/RAyD66Xh5DqRJRuKjg7lRZe/gvlwsVqgb7xPfJAknsgvxSQ/FBVW2yll85gc8xw3mRHwB9pCXlwynKuUEUauXPeC527pE+r3kjdkGOb42G7YMT0mf3G08znNq+hVmCe/kmTQ3Z3LM6ku+nCp8rYvI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768981907; c=relaxed/simple;
	bh=g545c90pA/SgKq4I+maJZfPTDyv1W31Ap78iXGj/7Dg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cn7jjn7HdOmCQJj+LZL9sIb+X6cP5x4YryrhdZFY9nxlL5AizEcW7f9QFmjdVF9xlsYVY5NxlubYVay/CgbfdGpGLLcaKSqZR7BakoNb3GBFn/Jf33LW3eAf+UU4Czlk4DpagpHkHLGKzHE+WBplFwsCFaiqu+viZKuJ0Kp+NmI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aqdUiR0R; arc=pass smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-40439fb8584so464604fac.0
        for <linux-doc@vger.kernel.org>; Tue, 20 Jan 2026 23:51:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768981904; cv=none;
        d=google.com; s=arc-20240605;
        b=Eu1jpLy2nKaXuFXiiYHzDRopvwwK/JKmX+758JoqJf42plue01dQUOx/lD7W/0pSEv
         IqNpN9JOcn1pyCo7AjuoOxg0VEEztcCI4zkD4jZtp8QQWk3W/+i9sR1zW914UECBOX2A
         Kvy3WIIPUdKzIFni/B7SvHhZJ1VEONPtMzCYj1SDbru4CBDH+jdyJEr313MEhQ5oV+Ou
         utbMJkw2wOmGkIHy/jRW8Et7Y0aZpQzGxQNqiYbmowhdQ97IU4qAzDC/G1c5bYRwokc8
         YFz/+XKSN+FiKemr4yvTLSsYVYcj7wr8AFeCt94K6r4CqWicJUVKQ41vGV9xawPLkUsT
         OrsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g545c90pA/SgKq4I+maJZfPTDyv1W31Ap78iXGj/7Dg=;
        fh=XwjhNcNACCTquB3Zi1MXPCW19+Kt/jZosnZ7Y0OsGjE=;
        b=adXlkrRKWDwnebr2FC6ZfPqbBZr2gp2qgrpDtuVg5Ig154gnSKe0ekk7DkL5deyxCB
         q7S8Ezq51VcExTKcKApMpzAYBNTkqa2D/sWRh8cMoiOS8uDC/U/vzkFG7B97hdY9Eshs
         IR8skuBWQbfjmkm/AJWoPg2OsQfbWrX1XP+rZMRyooHP6KBL+krNo6ODkTZPM8gP0o8w
         ndzVVEjzhgNrFMCZkG7njxH+Nh+VZCAjHciCFfvWtVQQOEtisyxYF0SnmtoKJ3zetikC
         wrQvZz0bX5x7KqYU1x4sDjy42YSm1yyr1bcxznVUP9l8KRuJruLCBvaFa0eAXz6O9WTr
         8qmA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768981904; x=1769586704; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g545c90pA/SgKq4I+maJZfPTDyv1W31Ap78iXGj/7Dg=;
        b=aqdUiR0RMrceucKIo0Bj71sYHd/BEKRGCRb2ej01y3IhdUPZhcMg4yEPBF4hC7vbby
         8xOsHBebwXCrb4DVCv18E6fzS/H1D4Z+0X9pk3NQcS8IAeNCBje+2ZUu077aTqFTKd2W
         sCOkAOoTTP14LBK7ZB5QnwjgdykWibj/Tbm6P/udoCohGUz5OucfAtsoRVFQAz1rL1hQ
         YWUGezZjJJw/PnOmxMB0mw3BWYfFUMXfMVrCcBIB/6wxrIf2LPVovPFvstKDW2UyGg+L
         AVp828JQBriWKgRdcW3x9Wl3USiH6ZiGO9j2hroWnyQeFWAZndTcdfto0tyfi08D05Di
         d6zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768981904; x=1769586704;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g545c90pA/SgKq4I+maJZfPTDyv1W31Ap78iXGj/7Dg=;
        b=CesEgh9GxCd/3LIKbG5S4X5+oUP3yDwhPZSk95rq/N+IzHLVuoZDVuWqw6H/6rU9GM
         ZWvPiPq29o1z+V3SIHOMtVhWrwcJNOByqaUWUMoqIAt4p+FAmrXGqdrzxVHOOB1GbnkN
         l+/90UkhRDbNeIQd5ghFKEm84lXeycmcI+MxJid5q0qTlsuyHa8D/xbgWMihZpOEy8xy
         BHHcEGfy6k7xyrxn6fKefZAeXVVbwM0f2SBRMXrzsgyXncojD29N85ZwnK6dX+G+52En
         jatUSL0i76qF0idFoeF3fkaegbzbCRZTUaOskvrtVP0THaEEAAdbamOBnM1+iIJ2YcLu
         Lk3Q==
X-Forwarded-Encrypted: i=1; AJvYcCU9EmpQ9YEgj80heZGPt0Z+lP1YO6yOsFfdv2E5UlEWG3pt7ItPHWUZB5GYz67gjXcm7osKFffP2Js=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuTiO8niP0vMMsWzCGGLMrA8tc3ygySDh1msblExQrLYnmkhNY
	wo+fZdKeF0YZrKlTGslAz3F+dhlTbUYqiMx0i0Wg2vEmTQyBh+cu6JFsncNqTh96L9Jr6700nVo
	tsOZyugopv2uBSG6Ie3DrTvTopVuDEnM=
X-Gm-Gg: AZuq6aJXvsszmN2W3opN4WIumBUm8AvNsvgH1vRbJfBTrMk2SWZJt2+Bu7pDvwf+KOw
	1cb2AA6Cz+0tTP3ifEmZUVglfF06HUNYG27uT/dac5/mjxXCfQjpH/WZrl24g1JdyLjvQfLoq/u
	lbthxh+hGkJIi0aKu7590zLhb1tGr03bALYI40nqH+OGCuys/EzXDw4u1dB/KKok1nIaYiwEIvS
	HHcK4tLU1QDhsoSavF2BiqioX52klPJWjmu+fTCc1sGE+qCME4sUB7+eVqTzUHQchba4v8=
X-Received: by 2002:a05:6870:e182:b0:3e0:aec2:8b50 with SMTP id
 586e51a60fabf-4044bcd1781mr9036507fac.22.1768981904378; Tue, 20 Jan 2026
 23:51:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251211124614.161900-1-aleksandr.mikhalitsyn@canonical.com> <20251211124614.161900-7-aleksandr.mikhalitsyn@canonical.com>
In-Reply-To: <20251211124614.161900-7-aleksandr.mikhalitsyn@canonical.com>
From: Andrei Vagin <avagin@gmail.com>
Date: Tue, 20 Jan 2026 23:51:32 -0800
X-Gm-Features: AZwV_QjOdqFT6ZDYYNe_D6EoD2DA9benRzTy_FihVDg6ZezW7yV43xAXiOZaKlk
Message-ID: <CANaxB-z8+UhZ+smuocN8h+YZY9tdKobhAu3H6fmzq+WzFmMrjg@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] seccomp: allow nested listeners
To: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
Cc: kees@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, Aleksa Sarai <cyphar@cyphar.com>, 
	Tycho Andersen <tycho@tycho.pizza>, Christian Brauner <brauner@kernel.org>, 
	=?UTF-8?Q?St=C3=A9phane_Graber?= <stgraber@stgraber.org>, 
	Alexander Mikhalitsyn <alexander@mihalicyn.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-73383-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[avagin@gmail.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,canonical.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 8831F53125
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Dec 11, 2025 at 4:46=E2=80=AFAM Alexander Mikhalitsyn
<aleksandr.mikhalitsyn@canonical.com> wrote:
>
> Now everything is ready to get rid of "only one listener per tree"
> limitation.
>
> Let's introduce a new uAPI flag
> SECCOMP_FILTER_FLAG_ALLOW_NESTED_LISTENERS, so userspace may explicitly
> allow nested listeners when installing a listener.

I am not sure we really need SECCOMP_FILTER_FLAG_ALLOW_NESTED_LISTENERS.
If nested listeners are completely functional, why would we want to
implicitly allow or disallow someone from using them?

Actually, even the current behavior of SECCOMP_RET_USER_NOTIF looks a
bit illogical. I think the following behavior would be more expected:
instead of running all filters and picking the most restrictive result,
the kernel should execute them one by one (most recent fist). If a filter
returns USER_NOTIF, the kernel pauses immediately to let the listener
handle the call. If that listener then issues "CONTINUE", the kernel
resumes by running the remaining older filters in the chain.

Thanks,
Andrei

