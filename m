Return-Path: <linux-doc+bounces-83888-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDBbEv5s5mmBwAEAu9opvQ
	(envelope-from <linux-doc+bounces-83888-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 20 Apr 2026 20:14:22 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CFD432993
	for <lists+linux-doc@lfdr.de>; Mon, 20 Apr 2026 20:14:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AD7E1325C87D
	for <lists+linux-doc@lfdr.de>; Mon, 20 Apr 2026 17:42:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B19F73A783A;
	Mon, 20 Apr 2026 17:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="vEBtyQih"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4493A7593;
	Mon, 20 Apr 2026 17:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776706843; cv=none; b=VnbCuuVwXpCGt+MdC/ROpkNPJBBF+aC5V4gro0+fa2HWFwh7L3iIGbnQ0TmStg8Q/oR8WRxBkarnQ37naHhOdIesWRwNtWhPkrxnUvl0qcA6Hi71gIaFocxDE5I4WTDHmoDkTF1L2BTThJrRoCPyZeoDxhS+nsNIkI48tLJhZyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776706843; c=relaxed/simple;
	bh=tLsRDq1DNJTHCMmwa4l1ohdBGwaK7G6Fun3K6cHQE88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JAWCSfXJPNNSM1DMNuHB9Eq/lCTBgz+QaVENcbrLZ7DtIo4+0CbNmi3I1wjO9vhOAL9Bba9xGOXJC8pfsNAzKaWC1333xndU8mR97rLVz2Uqxe863kdQTIVyW0UcaukgJX4FqGYT1fGRo+KjBRSLJ3TUO47jKVyfZX07UBxmCxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=vEBtyQih; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12610C2BCB7;
	Mon, 20 Apr 2026 17:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776706842;
	bh=tLsRDq1DNJTHCMmwa4l1ohdBGwaK7G6Fun3K6cHQE88=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vEBtyQih9u8XdcDlfahfz68TGfckYjA2qcffs7P9HZhqTdwIj0mxDtDtvfamdb8BX
	 hTxQYvUrCcvD3U/rnvdXurDeFXL6c0+/GiD3fgFxoU+rDYHKj5YtVRrQybi7dY+ocg
	 +sHe/fAhsv8WYBSxw6/aoSHMAfx6uesRpk76OE5A=
Date: Mon, 20 Apr 2026 19:40:39 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Blake Morrison <blake@truealter.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: coding-assistants: add optional Acted-By:
 trailer
Message-ID: <2026042035-retention-platonic-e5d5@gregkh>
References: <20260420142741.3187814-1-blake@truealter.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420142741.3187814-1-blake@truealter.com>
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-83888-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 15CFD432993
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 20, 2026 at 02:27:46PM +0000, Blake Morrison wrote:
> The existing policy correctly separates AI tool attribution
> (Assisted-by:) from legal accountability (Signed-off-by:). In practice,
> contributors increasingly work across pseudonymous and legal-name
> contexts, and a third slot -- identifying the human sovereign identity
> under which the work was performed -- lets downstream tooling (CI,
> provenance trackers, identity systems) bind a commit to a stable handle
> without disturbing the DCO.
> 
> Add Acted-By: as an optional, informational companion trailer. It does
> not replace Signed-off-by:, does not change DCO requirements, and does
> not mandate any format; the out-of-tree
> draft-morrison-identity-attributed-commits defines one such scheme, but
> contributors are free to use any handle form they prefer.
> 
> The three trailers then map cleanly:
> 
>   * Assisted-by:    -- what tool drafted this
>   * Acted-By:       -- who the human was, as a handle

I really do not understand, how would this actually be used?

And as you have to have a signed-off-by, why would you use two different
names for yourself this way?

And who is asking for this?  Who would want to use it?  How would you
use it for this very commit?

confused,

greg k-h

