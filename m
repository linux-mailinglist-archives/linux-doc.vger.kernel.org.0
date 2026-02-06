Return-Path: <linux-doc+bounces-75470-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6I0RI+SxhWmbFQQAu9opvQ
	(envelope-from <linux-doc+bounces-75470-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 06 Feb 2026 10:18:28 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB2BFBEE5
	for <lists+linux-doc@lfdr.de>; Fri, 06 Feb 2026 10:18:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A6F883066331
	for <lists+linux-doc@lfdr.de>; Fri,  6 Feb 2026 09:14:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E95C43587D4;
	Fri,  6 Feb 2026 09:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QGRsEiu3"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6AD5357A54;
	Fri,  6 Feb 2026 09:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770369269; cv=none; b=QNSe1ZS0aHhJYnox788ZHJLoh5EY8eXcsGyZzfZjELIe5UprFBJV3ONvYJnu/+a4F76M5HlQItOgoTMPYs9PRruNNDU3TQ4k6C6gejxvoqo8YYl9UIm0izF8vcHR4xUOLCl7JTj9Hxo76wShYWbPbG8oSGUEUiZbZSPrRECK+qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770369269; c=relaxed/simple;
	bh=GR8fSTSThsm9CDioVWJRxSN6y95a/im/CBM5f1ZeE1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DQFn3GVUGzFibOpZw1KWyYhV8nzIaDBLBRmn/ZmiADijqHk8/LmutyFZNzdeWRdP4+/TO7WvybvQVzVC6Z0snC9gsy6SCgkobo+opEvji28xO1TCb3pm+Ccxb7W2nO0nwDfY7B7bEOjY+9boqX2zPwYwg95i8E0S34jcZVaJZX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QGRsEiu3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ECBCC116C6;
	Fri,  6 Feb 2026 09:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770369269;
	bh=GR8fSTSThsm9CDioVWJRxSN6y95a/im/CBM5f1ZeE1E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QGRsEiu3AU9jqkqEBUd9fe3DyxmRQkoM2COqmCMf3ZSNgsos+K8ehdMG27obM6/Kh
	 E8UKUNVmHTYqUlffNxHJk7m8cZlzjuu8NhhRSqmKtsVsQ8Aw45OV/M/1gMT5YIyfso
	 9yfM276Yy3dSg0w4M+tkNqMRX1CbLOrMG5ccbhddZtqmhWdyHy9Ii+01slv7X+vbHD
	 pWDvg3zairuHbiFHF4DVPX/g7TAr43X3DHjFm4NKgiqw9g3fa0uaX0nOhNGAHYMck/
	 RevuvkuZxC72MCvJtVWdpzr7XAllUOAmt6WaOOFc9RMij1nkSUMMfxw6Y9Kv3RSZ1c
	 tkF/q1XayYKWA==
Date: Fri, 6 Feb 2026 09:14:25 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Linus Walleij <linusw@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Dan Williams <dan.j.williams@intel.com>,
	Jason Gunthorpe <jgg@nvidia.com>, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] Revert "revocable: Revocable resource management"
Message-ID: <aYWw8Th89QwHAuyT@google.com>
References: <20260204142849.22055-1-johan@kernel.org>
 <20260204142849.22055-4-johan@kernel.org>
 <aYRaB5wI3mS2J54K@google.com>
 <DG70CSP8NCJ0.316VXMVLD2ARN@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DG70CSP8NCJ0.316VXMVLD2ARN@kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-75470-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzungbi@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-doc,renesas];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CFB2BFBEE5
X-Rspamd-Action: no action

On Thu, Feb 05, 2026 at 12:56:47PM +0100, Danilo Krummrich wrote:
> should be
> 
> 	int revocable_init(struct revocable_provider __rcu **_rp, ...)
> 
> instead of
> 
> 	int revocable_init(struct revocable_provider __rcu *_rp, ...)
> 
> for the same reason revocable_provider_revoke() takes a double pointer.
> 
> Otherwise this seems racy:
> 
> 	int revocable_init(struct revocable_provider __rcu *_rp, struct revocable *rev)
> 	{
> 		struct revocable_provider *rp;
> 
> 		if (!_rp)
> 			return -ENODEV;
> 
> 		/*
> 		 * If revocable_provider_revoke() is called concurrently at this
> 		 * point, _rp is not affectd by rcu_replace_pointer().
> 		 *
> 		 * Additionally, nothing prevents a concurrent kfree_rcu() from
> 		 * freeing the revocable provider before we enter the RCU
> 		 * read-side critical section below.
> 		 */
> 
> 		/*
> 		 * Enter a read-side critical section.
> 		 *
> 		 * This prevents kfree_rcu() from freeing the struct revocable_provider
> 		 * memory, for the duration of this scope.
> 		 */
> 		scoped_guard(rcu) {
> 
> 		...
> 	}
> 
> Do I miss anything?

You're right.  Will fix that.

