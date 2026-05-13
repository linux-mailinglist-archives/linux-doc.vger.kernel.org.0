Return-Path: <linux-doc+bounces-87310-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kKJGBA41BGrdFgIAu9opvQ
	(envelope-from <linux-doc+bounces-87310-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 13 May 2026 10:23:42 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF84852F8EC
	for <lists+linux-doc@lfdr.de>; Wed, 13 May 2026 10:23:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 510EE307FEB6
	for <lists+linux-doc@lfdr.de>; Wed, 13 May 2026 08:20:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35EAB3A7826;
	Wed, 13 May 2026 08:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LKF7oI8t"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AC73A6B96
	for <linux-doc@vger.kernel.org>; Wed, 13 May 2026 08:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778660445; cv=none; b=WCRyyS3YwAnQNl9cuKZq3ylRfWqcXUikY5nVLn7e1SKaWj96c5KeApvnZS+0gcRRL49RMwSqrgANE96E8PtLF6sr22fmjQG+YlBSJesViO3GjAbLHlB/MdnqO631qoPzL+VsoL/fYkiDspWxafc0avp+qBIS5TcEYxsxPDknN38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778660445; c=relaxed/simple;
	bh=mrdlhu4L+5Fb+HroFyhZzTheHKDHNYLLO+UYk14lJiU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=P3m2U9WXuW6ZNJh37Q9tGobXvej8lV1fjXfP51yYyuZ/SImcPf9MgJEsr3sJG9+1DJxvZG5VFzxW7wJ89H1Yn3K0qy7qC8aTMtFV+G7Yy08EsVJvHtKznPX+/CHJcxZZxJ7JF91zlM2EKbKADP1fdxC76AP+b0cWqDTTSVR0Hxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LKF7oI8t; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778660440; x=1810196440;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=mrdlhu4L+5Fb+HroFyhZzTheHKDHNYLLO+UYk14lJiU=;
  b=LKF7oI8tWhOzdf9+pRuV4LYb5HEyhe3FrsqG2m56pE2NNGVxmjSQGdLh
   kZActffwBKvDlTYYOBMu84xbXpZwu78WMUYxFV54J4eNuQ+qdZ/vLkeD5
   N0qhpMHmkPgXnNnWogc4L7ATlhl8R+KEOAgK4eS7jN2wTuSkS8ZgNdW4S
   5nvugtwzCvLXtbCTsPV3eHXNdhwMmcgbfJJhpsCGDWNuXFAUOl2SrsOIK
   LGkjO38Cyg+em3zHgRqGYxtx0D02FqdwAOHtnBQ2gA9BLDMjR9hOQUs9e
   g0+7oz1GCZvKG4I6PZDq/f3aTXnVFFSR7k9uLsR/UJvjAt5SeX8f4pyis
   w==;
X-CSE-ConnectionGUID: kUDNZcK0RIKFNmoE4UvovA==
X-CSE-MsgGUID: VWTY8pXISqWZhPWGaJ/XNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="90964831"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="90964831"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 01:20:38 -0700
X-CSE-ConnectionGUID: aCCnmUyiQVS60myjFC3GXw==
X-CSE-MsgGUID: srWToqpPQKCZ43MRgj/5Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="233743494"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.61])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 01:20:36 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, Maxime
 Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH 0/3] Documentation/gpu: tables of contents cleanups and
 fixes
In-Reply-To: <875x4uw3bo.fsf@trenco.lwn.net>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <cover.1778238671.git.jani.nikula@intel.com>
 <ad1be55a146a3680ad920588a7cfdbc154b8a4fc@intel.com>
 <875x4uw3bo.fsf@trenco.lwn.net>
Date: Wed, 13 May 2026 11:20:33 +0300
Message-ID: <12f1a26615464dcdf0c0f08872ac2deb8aefa947@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: AF84852F8EC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-87310-lists,linux-doc=lfdr.de];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[jani.nikula@intel.com,linux-doc@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,lwn.net:email,intel.com:email,intel.com:mid,intel.com:dkim]
X-Rspamd-Action: no action

On Mon, 11 May 2026, Jonathan Corbet <corbet@lwn.net> wrote:
> Jani Nikula <jani.nikula@intel.com> writes:
>
>> On Fri, 08 May 2026, Jani Nikula <jani.nikula@intel.com> wrote:
>>> Make the GPU documentation slightly easier to navigate.
>>
>> Maxime, Thomas, Maarten, Jon -
>>
>> Any preferences which tree to merge this through? I'm thinking either
>> drm-misc-next or docs-next.
>
> Usually I stand back from DRM docs, expecting them to go through the DRM
> tree.  I can certainly pick up this set if that's best, but I wasn't
> expecting to.

Thanks. Since I got no reply from the others, and thought this was
benign enough, I went ahead and pushed this to drm-misc-next.

Also thanks Randy for having a look at it!

BR,
Jani.


-- 
Jani Nikula, Intel

