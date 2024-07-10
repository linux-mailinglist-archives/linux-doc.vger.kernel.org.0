Return-Path: <linux-doc+bounces-20403-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C5992D696
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jul 2024 18:35:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A6A121C20CE1
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jul 2024 16:35:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6745C198A3E;
	Wed, 10 Jul 2024 16:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="K5e1rOEJ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ZRJqhhQK"
X-Original-To: linux-doc@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C26C198A2E;
	Wed, 10 Jul 2024 16:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720629061; cv=none; b=pXdb+I8Mv18YEvkg6F8PL8cDpQj85MP4FweyFRsH3pfpOkxMdGMqsWE2y+aqNZRn5H/KSx5UCRdhj4AiZUOFVL5di9k8lRJfFwdBObxMmtuuWPSUgmqfsrWKpDKc5lJguw7mGXnvTAAVtXIixGN29aCDPC8+Mbp8p5DSfikGfLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720629061; c=relaxed/simple;
	bh=qm8HzHGB14wODOFL06yDYplOi81bFFr5NGK1biv0p4Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=X8G97+eXaOWhqMtSFv4C03VZrn+skYafVp+BYZp5k6fQ4CmFqVKX8R27Ah6ldd277npfVyj4UB7LWL6KWnBC55gys3TfVBL2zjiJlseXWWyC1RCOGPxIXEPAERPAKtl7QYm9r45wmnQioxQcaEFANyQHST2+gmzZxJSVE3lcuI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=K5e1rOEJ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ZRJqhhQK; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1720629058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jgD85imx0bsIe6NlKqUbd38t4bOO5gPuwGe/n2JVjEA=;
	b=K5e1rOEJmkG5famW39SvLbyRS29PJ+Sgci8kJT1Z63C98Jcrk4KYZLfJNJcpoVC7iwp178
	HAFdaYmvdGnnw4HtpGlVo1qF51h0jZKxmtEbc9ix2Y1P71sZRkN/+3PqieXuiQVQkUC6iI
	+ilTJqzrWRo4+oqiazgyNmtm/pe6VPc0nZ74ZWHaU7hmXc8jqvxv0WP5Jb/WJC6eLpIDfT
	R+UZq1b8SCv0ZAXdgZcLWXXU2LrbW5oq1DfWNllM8qNsTxfmWjoVZNbU6z7DxhatSDrBHu
	uulKuT22mNyV8bEJ23BV6znduIoUh+1aBXAjuZEkjfcfiE2knd8DsYIoMSpHbg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1720629058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jgD85imx0bsIe6NlKqUbd38t4bOO5gPuwGe/n2JVjEA=;
	b=ZRJqhhQKQGj8qRjlrIrNseiGxqcGwnyC72qAw6oIj3CGcJrFvs6R7cHbtm9en9sTEo2sIN
	iKMaaYef84PXwSAg==
To: Tianyang Zhang <zhangtianyang@loongson.cn>, corbet@lwn.net,
 alexs@kernel.org, siyanteng@loongson.cn, chenhuacai@kernel.org,
 kernel@xen0n.name, jiaxun.yang@flygoat.com, gaoliang@loongson.cn,
 wangliupu@loongson.cn, lvjianmin@loongson.cn, zhangtianyang@loongson.cn,
 yijun@loongson.cn, mhocko@suse.com, akpm@linux-foundation.org,
 dianders@chromium.org, maobibo@loongson.cn, xry111@xry111.site,
 zhaotianrui@loongson.cn, nathan@kernel.org, yangtiezhu@loongson.cn,
 zhoubinbin@loongson.cn
Cc: loongarch@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH V4][RESEND] LoongArch: Add AVEC irqchip support
In-Reply-To: <20240710043859.13053-1-zhangtianyang@loongson.cn>
References: <20240710043859.13053-1-zhangtianyang@loongson.cn>
Date: Wed, 10 Jul 2024 18:30:58 +0200
Message-ID: <87zfqpus3h.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Jul 10 2024 at 12:38, Tianyang Zhang wrote:
> Introduce the advanced extended interrupt controllers. This feature will
> allow each core to have 256 independent interrupt vectors and MSI
> interrupts can be independently routed to any vector on any CPU.

Why are you resending V4 if there have been review comments on the
original V4 submission?

Thanks,

        tglx

