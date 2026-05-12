Return-Path: <linux-doc+bounces-87043-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOLxCRbhAmpEyQEAu9opvQ
	(envelope-from <linux-doc+bounces-87043-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 12 May 2026 10:13:10 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FA351C824
	for <lists+linux-doc@lfdr.de>; Tue, 12 May 2026 10:13:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A5F70301F3F8
	for <lists+linux-doc@lfdr.de>; Tue, 12 May 2026 08:13:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91E3148C417;
	Tue, 12 May 2026 08:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IVMDGeKc"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D65C48C3EF;
	Tue, 12 May 2026 08:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778573577; cv=none; b=k7NrrVy9ZhzcwV11RWF4vshM2GIDW9bGxdU0eovWBnMshRhKz+eiX300Q3YpOUfljPvqKExi5lUIInIAukNTdPuDoR4ybk02tB0szgdz2mfchy/sPhHvz2I6gtAiv8QMxDL9zo/iG8d4z0ZWoeSRMW5JPBfESD45HEu3pFw3BR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778573577; c=relaxed/simple;
	bh=qtiatd0nSAUF+Q89Nbewhk7WjkI1dAtQGkhYNYnelVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b0/osmfEWEWbZMQN2hvVUPHf11SQ4uFbXdsXFE1481rjurBTgrABVk/oMSO3ga1u5yZrzLj4qBxszvzPpKvQ6J/NykbmNgMrMWzDH8HqBsLo/Gr2MMetL6LEVWaF949AXmzgtQ4ZlND7MwnARuZJjE3xekQXPqUqcl7yPnu9eT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IVMDGeKc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66D55C2BCB0;
	Tue, 12 May 2026 08:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778573577;
	bh=qtiatd0nSAUF+Q89Nbewhk7WjkI1dAtQGkhYNYnelVA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IVMDGeKcoSZJpErcSiCIpceir4ZQBLuUMyEnnsBTnDdwoAz/7DPGZbYpOTtbBWLaB
	 OyxJ/dYLtyVvLYcRdQOu/5H8WYZACUWvoDk3o7qqZ67y2H4DYn+7ANTRPjgDKDwShy
	 sLexeyBPANojkuPiUQHrHtDTatbjh1yfYe2eh5w5+Clrh4Z8Y+BnbnO9K+5+cJEnFQ
	 VYrZ18oBx0TmvZjQtq4C5mlmGEzwaYH5Z+cG+Xq8XlON9GMHdUwePztAikZqEsFvyf
	 ndvel5ZtClcEmmPnRvuu/Wje6FJDjCOi/K7VqKaGwAoHtiUnpsGAQJIRvnUfw2LsjE
	 MFR2qp3d0U/Iw==
Date: Tue, 12 May 2026 08:12:52 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev, driver-core@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-gpio@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jason Gunthorpe <jgg@nvidia.com>, Johan Hovold <johan@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v10 2/9] revocable: Add KUnit test cases
Message-ID: <agLhBHb5fMaNYpV7@google.com>
References: <20260508105448.31799-1-tzungbi@kernel.org>
 <20260508105448.31799-3-tzungbi@kernel.org>
 <CAMRc=McPez6Ver5NgrDPnM9YDb7cPonWE7BBsS_5AnY9tGf3xQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=McPez6Ver5NgrDPnM9YDb7cPonWE7BBsS_5AnY9tGf3xQ@mail.gmail.com>
X-Rspamd-Queue-Id: B7FA351C824
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-87043-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzungbi@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-doc,renesas];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Mon, May 11, 2026 at 06:10:32AM -0700, Bartosz Golaszewski wrote:
> On Fri, 8 May 2026 12:54:41 +0200, Tzung-Bi Shih <tzungbi@kernel.org> said:
> > diff --git a/drivers/base/revocable_test.c b/drivers/base/revocable_test.c
> 
> Please move this under drivers/base/tests/ where the rest of kunit modules
> live and name it revocable-test.c for consistency with the existing ones.

Ack, I overlooked the folder.  Will move the test to drivers/base/test/ and
rename it in the next version.

> > +#include <kunit/test.h>
> 
> Add a newline here as do other kunit modules.

Ack, will fix it in the next version.

