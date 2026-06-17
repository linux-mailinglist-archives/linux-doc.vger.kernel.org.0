Return-Path: <linux-doc+bounces-92617-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XIlYKvJ8Mmrg0gUAu9opvQ
	(envelope-from <linux-doc+bounces-92617-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 17 Jun 2026 12:54:42 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 062C0698B2E
	for <lists+linux-doc@lfdr.de>; Wed, 17 Jun 2026 12:54:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=M6TqAG66;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92617-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-92617-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD5C2301DB8A
	for <lists+linux-doc@lfdr.de>; Wed, 17 Jun 2026 10:54:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3911438E10C;
	Wed, 17 Jun 2026 10:54:40 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E8F38A700;
	Wed, 17 Jun 2026 10:54:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781693680; cv=none; b=aM+Ut2M6Uf0TkeCeEHJqKnIOqSbm4lHQvCCfGTHYEn8uynB9HjoAdPvHVERubI3i6yP7GLRjIAoFYgdhAIzafykMvVcUv8HNwL3XNl/BICJQ41LlAdMDhwd+OmpnAw6OaIs8uDM47LyLQv/nsEYkUJ/PTgqEbDVYF399ocOuvWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781693680; c=relaxed/simple;
	bh=6cQoc0XDwgSC3rq88jE9ZOu9X4zh8mv9B+GVkjwgNbw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mNTOVCOYOzsa/4GdSbsX+Um33fq1N17oAVJCxfSDgSRZkygjkGPI8RjTvmlAQWwoqKihjKk5JeFL8DH3P2t3jX0DsmjiYBrnkfDtyAACq9MmrNUsuheKaWPNqhzDTAgiEdMkfK4v0WBgdG/JqhzzBpestjU2BcVLIvbDBFMG080=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M6TqAG66; arc=none smtp.client-ip=192.198.163.15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781693678; x=1813229678;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6cQoc0XDwgSC3rq88jE9ZOu9X4zh8mv9B+GVkjwgNbw=;
  b=M6TqAG66mpXQfdzVqHbjvcNoQFcOHKDDTPVOIH64/w/c0AzcOLidC7og
   HjA4GLnCxad8+1ZlTWwjTO2h1G48sJvTnuud2epzgcB8u/ZpY7wIUNWbe
   BAV9lpPHrsmNWlvMBzXmH9IoyGmgYowAxtv75Tpw2gVejLQuZLoQEUBtG
   UppsUoW314FmaGcMGqKhXmAaRi/kdRnRw+19XzEWO45wNaAqmQ5Far0ju
   S5Rx8AWLzAMx2s65n1jeYZ9Br93e4URxCqJ60BrXt0QRIacs9+wFgUyif
   AaW/ZmqxQJDXHxndVzFomABRLYNHAqhMR3K6kvGydQoy1Ktbbt1MtNdaz
   Q==;
X-CSE-ConnectionGUID: nrX7vpcHQ0u2PsMtaT2dkg==
X-CSE-MsgGUID: 69+3ARYjR8CR4PPiCNoY6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="82573614"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; 
   d="scan'208";a="82573614"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 03:54:37 -0700
X-CSE-ConnectionGUID: kZdxgdTaTEWgttFmkm0QHQ==
X-CSE-MsgGUID: REd9SseKSFm2YWK0wPnkbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; 
   d="scan'208";a="245129648"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 03:54:35 -0700
Date: Wed, 17 Jun 2026 12:54:32 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Zhan Wei <zhanwei919@gmail.com>
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
	rodrigo.vivi@intel.com, corbet@lwn.net, skhan@linuxfoundation.org,
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] drm/xe/hwmon: document DG2 fan speed reporting quirk
Message-ID: <ajJ86P9MvLmtbPpp@black.igk.intel.com>
References: <ahqN8Esjz9SmGofH@black.igk.intel.com>
 <20260602161707.18922-1-zhanwei919@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602161707.18922-1-zhanwei919@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92617-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[raag.jadav@intel.com,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:zhanwei919@gmail.com,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:rodrigo.vivi@intel.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:intel-xe@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[raag.jadav@intel.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,intel.com:dkim,intel.com:email,intel.com:from_mime,black.igk.intel.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 062C0698B2E

On Wed, Jun 03, 2026 at 12:17:07AM +0800, Zhan Wei wrote:
> On DG2 the driver always shows two fan channels, because the
> FSC_READ_NUM_FANS command does not work on some cards. OEMs decide how
> the fans map to tach channels, so two fans can share one tach line.
> When that happens, the second channel reads 0 RPM even though the fan
> is spinning.
> 
> Note this on the fan2_input ABI entry so the steady 0 RPM is not
> mistaken for a driver bug.
> 
> Fixes: 28f79ac609de ("drm/xe/hwmon: expose fan speed")
> Signed-off-by: Zhan Wei <zhanwei919@gmail.com>
> Reviewed-by: Raag Jadav <raag.jadav@intel.com>

This one seems got lost in the noise. Any takers?

Raag

