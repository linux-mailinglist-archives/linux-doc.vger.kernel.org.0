Return-Path: <linux-doc+bounces-73893-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CPaPMHQDdWm+/wAAu9opvQ
	(envelope-from <linux-doc+bounces-73893-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 24 Jan 2026 18:37:56 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 411DF7E574
	for <lists+linux-doc@lfdr.de>; Sat, 24 Jan 2026 18:37:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E3ACE300D6B9
	for <lists+linux-doc@lfdr.de>; Sat, 24 Jan 2026 17:37:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C38621CC5C;
	Sat, 24 Jan 2026 17:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gsTdBhaQ"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783342BD0B;
	Sat, 24 Jan 2026 17:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769276272; cv=none; b=aGoo5ul6nUsChYDQSgDIAz9lhTL1HBqGwaHez0hO2+hvPwpfiIAoh9gCptAKYKDDjtKSwLNzL/NIniUojFPXtZKpN//djIez9RKQyKdHxHUVmroaAQUJV5wl1ZhlbQh7MJiMRSXvTdcpeiJZME4DXtO7oly6o0BikyAFQfObLHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769276272; c=relaxed/simple;
	bh=Gj9CsIaXQzoqE4KsQBlnriOHh2UaAKhGaQY0XCn7CdY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LsYgsQhau9sIC9/EzAOnXoRIXG4/4e7GVwIMXm4DYBvhEnFbcaTAh9ySXy0kuOapzl8rCgWYvBLr6qple1WN9cTVKR4y59qBBBn25Od4kbots0TecEZFH8sQtsGA/warbXlsQh/UDLZJFukW3tEUtUAiYo3Vg8xEuvWsBnrcTRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gsTdBhaQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E7F6C116D0;
	Sat, 24 Jan 2026 17:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769276272;
	bh=Gj9CsIaXQzoqE4KsQBlnriOHh2UaAKhGaQY0XCn7CdY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gsTdBhaQykkvqijyOcgOCeyiwi06Ub4gW3noeYmnOXq+vJLsgbGTuWR2bmKJIo5uL
	 avlpEBRkAZlUikSOkEi/5tU5ZCLBIDXvD9/KLS/dBMpMuMsIzs78esPylPzBx3KyOn
	 alr3fD4WyfJ//bCj6mUMKgPaQyAZQt60X4FYCDlEGAl0mMAbFmtR7d+xRVFwuhVHK+
	 RcuuAUPlRCuPKa9o/WZLT0rq+oEC0F9tYmZFq3Di6JWHTHxBsSe9XpWhozl6qJRe26
	 OPaMazjX8QjA/jahZqIKLq0CaHR4e/3ovOJ7a2btiVYWjBZcGfxlW+LwE9M61JjahK
	 Iq9hgL30rHCfg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vjha2-000000003o0-0p4T;
	Sat, 24 Jan 2026 18:37:50 +0100
Date: Sat, 24 Jan 2026 18:37:50 +0100
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Linus Walleij <linusw@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Dan Williams <dan.j.williams@intel.com>,
	Jason Gunthorpe <jgg@nvidia.com>, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] Revert "revocable: Revocable resource management"
Message-ID: <aXUDbpXmeepkN7oy@hovoldconsulting.com>
References: <20260124170535.11756-1-johan@kernel.org>
 <20260124170535.11756-4-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260124170535.11756-4-johan@kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-73893-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hovoldconsulting.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 411DF7E574
X-Rspamd-Action: no action

On Sat, Jan 24, 2026 at 06:05:35PM +0100, Johan Hovold wrote:
> This reverts commit 2da75b5b72559e5214a24aaf7ac933bb5bc2f1fe.

I forgot to update the commit ids before posting. This was supposed to
say:

	62eb557580eb2177cf16c3fd2b6efadff297b29a

and similar for patch 1 and 2:

	9d4502fef00fa7a798d3c0806d4da4466a7ffc6f
	cd7693419bb5abd91ad2f407dab69c480e417a61

Sorry about that.

Johan

