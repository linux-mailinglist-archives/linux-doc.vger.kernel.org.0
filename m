Return-Path: <linux-doc+bounces-89880-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qAbQDQRMGGr4iggAu9opvQ
	(envelope-from <linux-doc+bounces-89880-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 28 May 2026 16:07:00 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A75B5F35E6
	for <lists+linux-doc@lfdr.de>; Thu, 28 May 2026 16:06:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 770CA3133D20
	for <lists+linux-doc@lfdr.de>; Thu, 28 May 2026 13:53:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2221277007;
	Thu, 28 May 2026 13:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ew4jxaG6"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93BAE275B1A
	for <linux-doc@vger.kernel.org>; Thu, 28 May 2026 13:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779976412; cv=none; b=mikJWppu/FrxCpdRFYA1ZLDO+yqc5NgOGfBiIH9bc0RcJKGx8i7o2HW+VMNtarmVwkaqXlbbQdz4U5NHWLsyGvru2ULW4YB4+vx1fgvkI023hgdFoGiJ/InUoqfSkogOpk/lQhoD5en4DTUIJjSGpRYEubRdZVWg60mALJJ9yws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779976412; c=relaxed/simple;
	bh=N2/FfEmSB/DXKPxUOJcsHfQHJhIJZHJZbXhSw8EiQBE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=I/ojfr+K1E9tj14pXS0wJS+2G8WjS9+vI1GqFLa2vuwLVOR+9BW6Xd3p+anrLCitpylKj/2uoti03ZzQpO0t5oyQNTuAUYMjcbOmsaJTE74ludelSZtJPV2wUJ28UeEfU9rVQlIhO80jHTWbJZnyM1Jy5o+BXeBHLjYQG7/uQPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ew4jxaG6; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7524C1F000E9;
	Thu, 28 May 2026 13:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779976411;
	bh=sy9Ib1N/ndkD0KL+Q8VtgPA5qcxytBx25LWx2GOl+Jw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=ew4jxaG6LUmodTNOR2WkX/Rf5pNz6F0MVEau9DR5Q9tLUGtfhFQMfH5qtLZP+aozF
	 rPscTvY0WOkwiWHYfXC5g71Ls+tCL2Xc6kMwsWZtIlqYEdlVCYSNnJN6nLbt0SpCX7
	 FPBcq2ZVZJqgG5LWdD/vhFAg2/apoQ9XFekV43ZOiDMdhNSqofNVLxkAdpXZM3TYPj
	 2AwEGQhXrEy0s97Sor0TmwkL5zmkva9TBEoi97ckP2zsLgBJ+wSxct6PvYdALMw2lV
	 R39c3FCI99QHJIyGxJMb8AQC/U/qhWusTl4B1A9bEFYV+xQuAZJtTFpoZnNFwlZuUM
	 Qaus5fPPz5GYQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org,  Jonathan Corbet <corbet@lwn.net>,  Shuah
 Khan <skhan@linuxfoundation.org>,  Pratyush Yadav <pratyush@kernel.org>,
  Michael Walle <mwalle@kernel.org>,  Takahiro Kuwano
 <takahiro.kuwano@infineon.com>,  linux-mtd@lists.infradead.org,  Miquel
 Raynal <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH -next] mtd: spi-nor: testing locking, fix new doc build
 warnings
In-Reply-To: <20260526172341.773398-1-rdunlap@infradead.org> (Randy Dunlap's
	message of "Tue, 26 May 2026 10:23:41 -0700")
References: <20260526172341.773398-1-rdunlap@infradead.org>
Date: Thu, 28 May 2026 15:53:27 +0200
Message-ID: <2vxz4ijr4p48.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-89880-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pratyush@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,infradead.org:email]
X-Rspamd-Queue-Id: 2A75B5F35E6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 26 2026, Randy Dunlap wrote:

> Add a blank line to prevent documentation build warnings:
>
> Documentation/driver-api/mtd/spi-nor.rst:215: ERROR: Unexpected indentation. [docutils]
> Documentation/driver-api/mtd/spi-nor.rst:216: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> # for spi-nor/next

Folded into "mtd: spi-nor: Add steps for testing locking support".
Thanks!

-- 
Regards,
Pratyush Yadav

