Return-Path: <linux-doc+bounces-75180-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id K6xmJJWrgmnYXwMAu9opvQ
	(envelope-from <linux-doc+bounces-75180-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 04 Feb 2026 03:14:45 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB30E0BCC
	for <lists+linux-doc@lfdr.de>; Wed, 04 Feb 2026 03:14:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5109230125F3
	for <lists+linux-doc@lfdr.de>; Wed,  4 Feb 2026 02:14:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BFCF29993F;
	Wed,  4 Feb 2026 02:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ahKnpcSm"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3888628980E;
	Wed,  4 Feb 2026 02:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770171260; cv=none; b=SDROBgzO1s5TJDjm7NX8tlVLxzw1b/b2pYB7tT+z/TpfElcxaUWHAFFcaReLAcXiaEictDgUL2BaVw1kTrYK0+KJ8R67benghV3GGXJI9wLaOhYmvL3smaq/nR/LGPFPYNBiDaUAv65adeIr8HuyYpmJkzOUtyq7FzXKxr2GjEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770171260; c=relaxed/simple;
	bh=Un5Ao1i2HGVwBkHeGiBEE4V1wnLL8+sWjW5dihBWKWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mrhGrKpo0M82IWfvHm9xmpJaTSi7Li3scXLHf4Gz79TCSdfNRWUPvAxIASgqTq7ysW9PGMMEOetnvBZxk1WQDMMimhcj5slUuMBSeqelhDLEK7cbWYKIjAbV0y69O+U5MpUpGi3TdYq9gL8X83XaWNDbUOeKci1lYO74YQBG4G4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ahKnpcSm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71A16C116D0;
	Wed,  4 Feb 2026 02:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770171259;
	bh=Un5Ao1i2HGVwBkHeGiBEE4V1wnLL8+sWjW5dihBWKWg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ahKnpcSmufQ3wRTr42dWbiKE7df9t2yNNMbdJ3PL3ErArqxtA1GnF/QZPXp92wDvd
	 o3Lm98oUZW7JqTwjjmTKSqfuiFMRs89EjNWBP2HLD0lRKrzCO5/p75QYIp8htjSgU7
	 9zJyAxpZ104+Qz+nii7qNXjMPiYQ+x6qSuEDOwMuwwhM204c6XTvxdJsmRFlEpwQWo
	 2PM9Pr0Rny2kIejzlOgIwamZpR/3I5FwLT0AQHe0YAVn2ZWGVwajMNET/YCWFBMgiE
	 +oDHQ/nj05/t0SGH+pSN5l40TOXlmIKDlWrU/bZLtHpovfuuJEJ7r9AhOR1LYX7u4H
	 Ww3lE9XYnpq/A==
Date: Wed, 4 Feb 2026 02:14:15 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Johan Hovold <johan@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
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
Subject: Re: [PATCH] driver core: disable revocable code from build
Message-ID: <aYKrdxw3fYf-y52P@google.com>
References: <20260124170535.11756-1-johan@kernel.org>
 <DFX20SA67PF2.VONCFNDOZOZT@kernel.org>
 <2026012554-chatty-policy-42a1@gregkh>
 <aXdxDBXdyqLFfKKI@hovoldconsulting.com>
 <aYHm9pr0e7myeqS3@hovoldconsulting.com>
 <2026020315-twins-probe-d988@gregkh>
 <2026020307-rimmed-dreamy-5a67@gregkh>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026020307-rimmed-dreamy-5a67@gregkh>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-75180-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxfoundation.org:email]
X-Rspamd-Queue-Id: AAB30E0BCC
X-Rspamd-Action: no action

On Tue, Feb 03, 2026 at 01:30:37PM +0100, Greg Kroah-Hartman wrote:
> The revocable code is still under active discussion, and there is no
> in-kernel users of it.  So disable it from the build for now so that no
> one suffers from it being present in the tree, yet leave it in the
> source tree so that others can easily test it by reverting this commit
> and building off of it for future releases.
> 
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

And also:

diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
index 11b6515ce3d0..56e44a98d6a5 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -17,7 +17,6 @@ TARGETS += damon
 TARGETS += devices/error_logs
 TARGETS += devices/probe
 TARGETS += dmabuf-heaps
-TARGETS += drivers/base/revocable
 TARGETS += drivers/dma-buf
 TARGETS += drivers/ntsync
 TARGETS += drivers/s390x/uvdevice

With that,
Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

