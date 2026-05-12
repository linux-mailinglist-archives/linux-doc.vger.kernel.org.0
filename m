Return-Path: <linux-doc+bounces-87085-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCbBCLkTA2r20AEAu9opvQ
	(envelope-from <linux-doc+bounces-87085-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 12 May 2026 13:49:13 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6839651F918
	for <lists+linux-doc@lfdr.de>; Tue, 12 May 2026 13:49:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 80F3F3015E33
	for <lists+linux-doc@lfdr.de>; Tue, 12 May 2026 11:48:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B109349CD3;
	Tue, 12 May 2026 11:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fn4h7qtM"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A9825B096;
	Tue, 12 May 2026 11:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778586530; cv=none; b=OupFfO6fRBvC2jRXYFEiYU5HW8ShSR7PCElPFjSerhWsfNfC35SRrCWAF+Mt4bg5BaNG2Vwsl0aIa5BvXq3yMf8Bw6gcAcdG8M6eWuXj8rMbdZeRzb/arzYYfuwzW2ZdwRFemoG96cuENNfrEv+MEw0woG12MYecY3A7v0C8HKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778586530; c=relaxed/simple;
	bh=k/otDlKzIfO5cxQKbfHbfRAHJJclqMf2XTJj3Znmh7k=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dGilbaVdgA6wjsxo9UzDEM2At3JCguUpg9QUAQAd30/yafu5zyGJZELx8uYRr+45s+KtSSxyRuuvXn4X7t9uvarDISGFHhjQbMgd8rn3POxkWZsxxOVuK7JXiJpgpxIShBwKEdJJkwdZG4ZcEOrHuVPMpwSddLOz2JVS9Cazn5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fn4h7qtM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37E31C2BCB0;
	Tue, 12 May 2026 11:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778586530;
	bh=k/otDlKzIfO5cxQKbfHbfRAHJJclqMf2XTJj3Znmh7k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=fn4h7qtMheJpCFj6wdrSe0n3Ys1uWT6bDfbtohYDlyhRV0vP3kCuXWu5ClrgOR+2t
	 q0j+HVMXkGPWoz+PBU5ILTU58gDAsyyO5da80GUv31Gg0XnfvIub/Q+AmjcXMSW5J/
	 2ZkiM3yf0y6ONbB/2I8l+vkJnO1VPxZugfG1NMsUC9/JQYfQ8E93w9dGjaAdgXaYZ+
	 DN1ojf76OrN665i1pUXYxIMWy9gSTbNThPFBcy0bZi1nfAy6DgGBYGqbe5CjC+3pw9
	 zO8/kpHWtLU9s+11k5Y8XIPk+fRfk4XHt3/cDZ9Y70cjoO6wO0Gy/hS4HVd7XsYSxm
	 iXQ1mhOYVPS6A==
Date: Tue, 12 May 2026 12:48:36 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Rodrigo Alencar via B4 Relay
 <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: rodrigo.alencar@analog.com, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org, David Lechner <dlechner@baylibre.com>, Andy
 Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Michael
 Hennerich <Michael.Hennerich@analog.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Andrew Morton
 <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, Steven Rostedt
 <rostedt@goodmis.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky
 <senozhatsky@chromium.org>, Shuah Khan <skhan@linuxfoundation.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v12 00/11] ADF41513/ADF41510 PLL frequency synthesizers
Message-ID: <20260512124836.28047891@jic23-huawei>
In-Reply-To: <20260510-adf41513-iio-driver-v12-0-34af2ed2779f@analog.com>
References: <20260510-adf41513-iio-driver-v12-0-34af2ed2779f@analog.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 6839651F918
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-87085-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,rodrigo.alencar.analog.com,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Sun, 10 May 2026 13:42:18 +0100
Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org> wrote:

> This patch series adds support for the Analog Devices ADF41513 and ADF41510
> ultralow noise PLL frequency synthesizers. These devices are designed for
> implementing local oscillators (LOs) in high-frequency applications.
> The ADF41513 covers frequencies from 1 GHz to 26.5 GHz, while the ADF41510
> operates from 1 GHz to 10 GHz.
> 
> Key features supported by this driver:
> - Integer-N and fractional-N operation modes
> - High maximum PFD frequency (250 MHz integer-N, 125 MHz fractional-N)
> - 25-bit fixed modulus or 49-bit variable modulus fractional modes
> - Digital lock detect functionality
> - Phase resync capability for consistent output phase
> - Load Enable vs Reference signal syncronization
FWIW I have taken another look through and didn't have anything to add.
So I think it's now you vs Sashiko!

With that in mind I'm fine with you not waiting as long as normal before
sending a v13.  Whilst I still would like some level of tag or informal
'it's fine' for the string parser from those who were feeding back on
earlier versions that bit isn't going to change anyway for v13 and
so probably not worth holding it back for that.

Thanks,

Jonathan


