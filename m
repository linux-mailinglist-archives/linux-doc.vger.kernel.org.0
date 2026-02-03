Return-Path: <linux-doc+bounces-75059-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8CRRIb0KgmmCOQMAu9opvQ
	(envelope-from <linux-doc+bounces-75059-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 03 Feb 2026 15:48:29 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EFCDAC80
	for <lists+linux-doc@lfdr.de>; Tue, 03 Feb 2026 15:48:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 59D99302CF18
	for <lists+linux-doc@lfdr.de>; Tue,  3 Feb 2026 14:48:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59772394489;
	Tue,  3 Feb 2026 14:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="lzdRyOhm"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2779E2E92C3;
	Tue,  3 Feb 2026 14:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770130104; cv=none; b=BrKantcYKpuefUJYPLa5RCE1ZCsKAFpk6kQyKQ7W7UJIMEx8J1dADkPYGgq/Sec+D/jD/j8UyQWwEn+xZFc5CrMsUcMboToM+qX9wec7sDEPPqjCLBR+WZOzDcyWJGz62VL0L6Le1iunOZUlpchtrVq8TX3kZFNqJTtUgmvrRkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770130104; c=relaxed/simple;
	bh=n3cfsDaFatREc4+QUvMlup0Lh0X+zz8QT4fCqZErkhg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a4rjEpwZUIA/Com2ExdxXt4MoA39cJ7umqtRSdKfKZlcXtw78o3KfPyXJkBS102TVL2Daw0IpwSiNEHHF1UGQ5QR0C0SYZG9B8H7m1P1rpas80obZm+5DgYLkz1krw/2gs4sR3dqTE0FJ1aXD+iUAREfcOXhUpqgVCRI039RMbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=lzdRyOhm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C01BC116D0;
	Tue,  3 Feb 2026 14:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770130103;
	bh=n3cfsDaFatREc4+QUvMlup0Lh0X+zz8QT4fCqZErkhg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lzdRyOhmKHmiDdQtfJSTGsT1tLrg8cP9jcbl5WHbGArK+U30qKYYYtzepSPd8SDuM
	 aicgmPLlUdh/v34Nmi6Wbh/XGXC+w+TAQoZHhJ7kvm7eiNuVhxox5iA4/vnqs8L+Wf
	 e1ohTiQuJFtzsaB+d/vhhhOOwfOQEmlMA8qB/CqU=
Date: Tue, 3 Feb 2026 09:48:22 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Amitabh Srivastava <amitabh@amidevlab.com>
Cc: corbet@lwn.net, workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs: maintainer-pgp-guide.rst: updated kernel.org
 link
Message-ID: <20260203-spicy-terrestrial-jaguarundi-701efd@lemur>
References: <20260203050020.27792-1-amitabh@amidevlab.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260203050020.27792-1-amitabh@amidevlab.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-75059-lists,linux-doc=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konstantin@linuxfoundation.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amidevlab.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 26EFCDAC80
X-Rspamd-Action: no action

On Tue, Feb 03, 2026 at 10:29:48AM +0530, Amitabh Srivastava wrote:
> docs: process: maintainer-pgp-guide.rst: updated the http link for

I missed this the last time, but you don't need to duplicate the "docs:
process:..." line here.

> 'add the kernel.org UID to your key'. Added SPDX-License-Identifier
> to fix checkpatch.pl warning. Tested kernel using qemu-system-aarch64

You don't need to mention how you tested it (great that you did, but it
doesn't need to be in the commit).

> with busybox inside a multipass ubuntu VM on macos.

I suggest that your submission should look like this:

    Subject: docs: process: maintainer-pgp-guide: update kernel.org docs link

    Update http link to the documentation about how to add a kernel.org UID to
    the maintainer's key. Add missing SPDX-License-Identifier to fix a
    checkpatch warning.

    Signed-off-by: ...

This has the following improvements:

- removes duplicate info that is already in the subject
- uses imperative mood that is required for commits (update vs updated)
  see: https://docs.kernel.org/process/submitting-patches.html#describe-your-changes

> Signed-off-by: Amitabh Srivastava <amitabh@amidevlab.com>
> Reviewed-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>

You shouldn't do this -- I didn't actually reply with  a "Reviewed-by"
trailer. These trailers are given by the reviewer to indicate "I have reviewed
this and didn't find any problems with the patch. You should only add trailers
that you have actually received from reviewers.

Please send a v3 with these fixes and that should earn you a "Reviewed-by."

Best regards,
-- 
KR

