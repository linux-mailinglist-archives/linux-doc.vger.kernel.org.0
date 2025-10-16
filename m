Return-Path: <linux-doc+bounces-63559-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BB02ABE4077
	for <lists+linux-doc@lfdr.de>; Thu, 16 Oct 2025 16:54:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4DC4B19A0C2E
	for <lists+linux-doc@lfdr.de>; Thu, 16 Oct 2025 14:55:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA39A334374;
	Thu, 16 Oct 2025 14:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rEWj5eds"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1246B3254B7
	for <linux-doc@vger.kernel.org>; Thu, 16 Oct 2025 14:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760626494; cv=none; b=ChNiqubVotVwwotgm2BS0kyiIV86KvkcGABA7ApwzAfntLE+TNiOivcHMHGHHNyRKghDdD5xgX+CYIS6K/OB8BCLbY3y9mBSGibbp88Jmj4NteNuMDB+YNJ8TDlwQmh9dNSfSjJkqf1mCA5Aj6sgzoJOCYHn7Y73/jbKpbGktAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760626494; c=relaxed/simple;
	bh=k6RWhJZ+4jTq6Knupn4lp76iECn20wDlXqE1y+9I4+E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NGIL1ahgdf5NtorA2dbzRz7pvkuKW/NjXmjsNid4aOiLt/htB8pobqj42SvYH36XSbHB553LaO1jy0GBtvzPs+3gULEbLNI0bJ+ceANsFFVxLr0Lu+FQ2VIdLVc1WMM8g4sHh2PQojuy9sJ429Gb9y3Rvshbn2MKZAYA6lbm8Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rEWj5eds; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3ecdb10a612so1511995f8f.2
        for <linux-doc@vger.kernel.org>; Thu, 16 Oct 2025 07:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760626491; x=1761231291; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=j1x4kkcjWPTIpdS3PJl04Vmqlf3X+DwnupzRCpMcKwc=;
        b=rEWj5edsSC99X2pkP7Ked95M6IGennQMOQHrkk+gBttUFsx3FfNSeetsmJHXju00mv
         J2uSZImqwoMGxxytaOqn7d/NPhAsjVLDz3mMoqAX98RVn6LZ/HWzDIL4MD+d/GdjCjrs
         njWOLmui7HAoRifOI26nt1KF8eRxB2BNgu9reLo/9ZT6X7ZrzPlTeO/3lOs4lp1bNbeT
         33KY6cJdlE2pYpp9lOQzIn+sxswCwOkBynJbzqTWSDlZFnc86J6dDW1w+qOxwdMLPIYr
         Noq0HYa0p7nZx6cPegPGGqTsBqO9rSW7uX7ybujTnILpxJcZmDByBesAvs7Pw3bmgnwj
         v2ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760626491; x=1761231291;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j1x4kkcjWPTIpdS3PJl04Vmqlf3X+DwnupzRCpMcKwc=;
        b=SXxtM/jn6l6qsRVNYeJcSSGPeIooO9yZ/dKrfSP1npZC6GIP85OFWEH/jpsQ1EvZHF
         3vnHlwyrrLKKwyJbCYZQ1tZVdQJQ0YDI4NPZk5oHd9mVpf5MUP6T5NI8Pgt5PfG9jyFe
         GzSgrpGHd1OdRuFL2ISHBoAq+AlGvSd2flzqfb6lNeR1PbQFI02RR9ujLmEnWbwl6tLZ
         fXitqQK88pDLRx84vzP46KmxbG2NSI30Hr9HLR4sqOOlFHzn3Zpz0RuAzKaN3apZku9E
         5iXeq6xcYclu4b9935ysSkWjE75MH75zv5yPhfamW07RZVdkwYyjvnfQHBtoBVX4/hGg
         yQ4w==
X-Gm-Message-State: AOJu0Yzq76A8YSpAMg7YQLpX0LmnqpdvVJElm4gtPq5t9mTKQRAU/MbI
	PepXLzqHIeJdSaLGHRNpIqBd9/9UovtHA2vyzhcKvDS53tfc4XjVzmUMSpVSfhlMWnmimKutZWA
	Op0Qom1zuE3IpdQ==
X-Google-Smtp-Source: AGHT+IFUAM1+v17VGshRyYrldIe2tyV2DPBK/Lw8YyAgQy2xa1KH/p2eEWwiYMB9Z9jELiZ5yaCbqQRVhBFrsg==
X-Received: from wrpa2.prod.google.com ([2002:adf:eec2:0:b0:3fd:a97d:9105])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5f82:0:b0:3e6:116a:8fdf with SMTP id ffacd0b85a97d-42704d7eb5amr371388f8f.13.1760626491456;
 Thu, 16 Oct 2025 07:54:51 -0700 (PDT)
Date: Thu, 16 Oct 2025 14:54:50 +0000
In-Reply-To: <20251015-l1d-flush-doc-v1-0-f8cefea3f2f2@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251015-l1d-flush-doc-v1-0-f8cefea3f2f2@google.com>
X-Mailer: aerc 0.21.0
Message-ID: <DDJU0415JEBQ.H2SD942NMDWX@google.com>
Subject: Re: [PATCH 0/2] Documentation: fixups for L1D flushing
From: Brendan Jackman <jackmanb@google.com>
To: Brendan Jackman <jackmanb@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, 
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Balbir Singh <sblbir@amazon.com>
Cc: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed Oct 15, 2025 at 5:02 PM UTC, Brendan Jackman wrote:
> Signed-off-by: Brendan Jackman <jackmanb@google.com>
> ---
> Brendan Jackman (2):
>       Documentation: clarify PR_SPEC_L1D_FLUSH
>       Documentation: fix reference to PR_SPEC_L1D_FLUSH
>
>  Documentation/admin-guide/hw-vuln/l1d_flush.rst | 2 +-
>  Documentation/userspace-api/spec_ctrl.rst       | 6 +++++-
>  2 files changed, 6 insertions(+), 2 deletions(-)
> ---
> base-commit: 0292ef418ce08aad597fc0bba65b6dbb841808ba
> change-id: 20251015-l1d-flush-doc-029f64d2b0d3
>
> Best regards,

I just noticed another issue - the docs say you get -ENXIO if control
isn't possible, but for L1D_FLUSH and INDIR_BRANCH you get -EPERM.

TBH I think this is a bug but it seems like it's still better to just
document it than change the behaviour.

