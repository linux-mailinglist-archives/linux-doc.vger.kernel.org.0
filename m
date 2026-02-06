Return-Path: <linux-doc+bounces-75505-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULWtKeL4hWlEIwQAu9opvQ
	(envelope-from <linux-doc+bounces-75505-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 06 Feb 2026 15:21:22 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D05FEC02
	for <lists+linux-doc@lfdr.de>; Fri, 06 Feb 2026 15:21:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D2C97300D33F
	for <lists+linux-doc@lfdr.de>; Fri,  6 Feb 2026 14:20:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D8023EF0A7;
	Fri,  6 Feb 2026 14:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="SThrP9UM"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D7C212542;
	Fri,  6 Feb 2026 14:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770387643; cv=none; b=RRilEIYEM129XGL6yLX0cMiRLxNgL31g0AA4SoKo6e3Neq4X+n1yKYuL/xfZAB4awwZ290bwK/ThHAKF3cXlMUYjhhTfmBFaTOYDXK6X88V9h1pYHJsblwcV1ecFuyInwgf5C8TJzLHMS0aYJc19HL9+IYqmVSZdCji5BRdevMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770387643; c=relaxed/simple;
	bh=osDICSbP91q/H/zGn1e7ih3r/sIimL8SLGHT+/txPtA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DyIPS4Kg5ZTYfqRecQ0zkejMTd/J/QN7WRzph3Gi1CX09HaUGiLiraIl9iiuc7adGPFj/uFIpXjT0abtwQLg4UGi1Ho9fsFCO1cNAtYxLZbjvVzHUT4x/fisZOFejYBmpu/kbxGB1yvDfwaLO4KtgPr+WQDLMrra07sAH0vP4xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=SThrP9UM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65909C116C6;
	Fri,  6 Feb 2026 14:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770387642;
	bh=osDICSbP91q/H/zGn1e7ih3r/sIimL8SLGHT+/txPtA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SThrP9UMc7G/CANDPQICfAMT8ncw1llVEsrbdvH/ybb3UGTVJqRADHZm/qZi9QhyD
	 X8HTx6mbtwfVvsHWGVN0mmRK5c07GVB9vMEXKGKZiqYsHt5+vtATbMV3o4M0G/U/c7
	 VhdXJdv5Cwry+/PUK//nrFckqTteNXEMenpqgaTE=
Date: Fri, 6 Feb 2026 09:20:38 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Amitabh <amitabh@amidevlab.com>
Cc: Jonathan Corbet <corbet@lwn.net>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] docs: process: maintainer-pgp-guide: update
 kernel.org docs link
Message-ID: <20260206-fluorescent-straight-partridge-cf42ef@lemur>
References: <20260205115554.7795-1-amitabh@amidevlab.com>
 <875x8bi6su.fsf@trenco.lwn.net>
 <E285CDA1-776F-44AF-9C6D-AB43F4EC5054@amidevlab.com>
 <87sebfgqdf.fsf@trenco.lwn.net>
 <3AB51D59-A054-4847-91CD-DFF3A2EB5F04@amidevlab.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3AB51D59-A054-4847-91CD-DFF3A2EB5F04@amidevlab.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-75505-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: 97D05FEC02
X-Rspamd-Action: no action

On Fri, Feb 06, 2026 at 12:02:00AM +0530, Amitabh wrote:
> > I am aware of kernel documentation practices :)  "Typically licensed"
> > does not tell you what any individual contributor intended, though.
> > *Probably* that tag is OK, but you should really consult with the
> > original author of that page to ask what their intent was.
> 
> You are absolutely correct. In fact, the original author, Konstantin Ryabitsev,
> (in TO here) responded to my v1 patch in the affirmative regarding the changes.
> (https://lore.kernel.org/all/177006480695.901069.1641199463436529014@lemur/)

Yes, that matches the intended license.

-K

