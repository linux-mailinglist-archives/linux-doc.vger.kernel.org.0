Return-Path: <linux-doc+bounces-94291-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id k2IOEcy/RGrr0AoAu9opvQ
	(envelope-from <linux-doc+bounces-94291-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 01 Jul 2026 09:20:44 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5786EA932
	for <lists+linux-doc@lfdr.de>; Wed, 01 Jul 2026 09:20:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=dKMCi26D;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94291-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-94291-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linuxfoundation.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 80A36301AB8D
	for <lists+linux-doc@lfdr.de>; Wed,  1 Jul 2026 07:20:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1399F3B19D4;
	Wed,  1 Jul 2026 07:20:41 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5DA386C24;
	Wed,  1 Jul 2026 07:20:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782890441; cv=none; b=Rn0Kdo8gbzYtDzgKBPro/+SblQyTgfOhVaVjtrit2nKIQoKMkDrNo+LZKyR2Ec4KxluRiCD7p0/smHW/FhmCPoq6nzPYIwHyLyiN/ZRIeI5HyAo9Y0qcskzQfnqwnDFY+lxeTBFbUYjybl6PRXH0WACJ2XANNDcHq5TzeUFpwik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782890441; c=relaxed/simple;
	bh=bOcwdlvrB8Ehn5Csie4Yehgl0UKcGfcP3sIJAIKz/OA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bQJuAje71riPVuR9RhAwEZF7hqsg4bulP5sapq9c5Q4lLOGVDkG4IJDx11cuAswvYYor4BXSXBGoOsQa1L7RdVboQEBGH5dOa/2s0t4b2gZriSo38NugK4NdNzc7PPKqse7V2r5d5mMIoBy1rFyk97kOdXClaYzFXU7GBgF8wMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=dKMCi26D; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D1151F000E9;
	Wed,  1 Jul 2026 07:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1782890439;
	bh=aDsZvo1S7Yg7bB8Qh4hUT2oygbCaSH+pPQ6xt1kwzg0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dKMCi26DaBx3zYW/1o17Cj5agyQuEXODWD0xV2Q8BDJW+F+1roSo18SP95XCOygGH
	 IjcEAwvxpP1BNLRGyiFhCKvL2VSHDQ1znana+XHzyxzKarp9uQzFSn2uT9xV5V/Pqz
	 gd8Op5Qt8aMtEHVN/dhXZ3ZEpdMWEVPrn3iXuWwQ=
Date: Wed, 1 Jul 2026 09:19:25 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, driver-core@lists.linux.dev,
	tfiga@chromium.org, senozhatsky@chromium.org,
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v5 1/2] PM: sleep: Rename module parameters prefix to
 "pm_sleep"
Message-ID: <2026070110-unrented-crummiest-d6af@gregkh>
References: <20260701045640.3130090-1-tzungbi@kernel.org>
 <20260701045640.3130090-2-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701045640.3130090-2-tzungbi@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tzungbi@kernel.org,m:corbet@lwn.net,m:rafael@kernel.org,m:dakr@kernel.org,m:skhan@linuxfoundation.org,m:pavel@kernel.org,m:lenb@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:driver-core@lists.linux.dev,m:tfiga@chromium.org,m:senozhatsky@chromium.org,m:rdunlap@infradead.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[gregkh@linuxfoundation.org,linux-doc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-94291-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gregkh:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linuxfoundation.org:dkim,linuxfoundation.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BE5786EA932

On Wed, Jul 01, 2026 at 04:56:39AM +0000, Tzung-Bi Shih wrote:
> Currently, the module parameters defined in drivers/base/power/main.c
> use the default prefix "main" (derived from the filename).  The prefix
> is too generic and non-descriptive.
> 
> Redefine MODULE_PARAM_PREFIX to "pm_sleep." to group the module
> parameters under the namespace instead.  This makes the parameters more
> descriptive.

You just changed the user/kernel api, right?  That will break things...

