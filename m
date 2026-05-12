Return-Path: <linux-doc+bounces-87053-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGXGBLfqAmpKygEAu9opvQ
	(envelope-from <linux-doc+bounces-87053-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 12 May 2026 10:54:15 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3441951D137
	for <lists+linux-doc@lfdr.de>; Tue, 12 May 2026 10:54:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 45D813056362
	for <lists+linux-doc@lfdr.de>; Tue, 12 May 2026 08:52:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05E4839A074;
	Tue, 12 May 2026 08:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="boMrmV8N"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DCF3932D8;
	Tue, 12 May 2026 08:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778575944; cv=none; b=JpUsZ97FWlwyQAXhLlO2fq+bmTyP14jR0Dtt371yaCJ2lA8noKJZcoQTf0D0XRa7Yygw0lh4Z3+VV3P8aiLvsLdiAY690Vb/MHJQXnjAiCLfC7/LNL17qE8k7SeQEDLbKeq1hxRegg3RPYHihh1UT56CYpLNJWR89wFPkNyogrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778575944; c=relaxed/simple;
	bh=BCrJOeW+G/hzkswZS9tEKFKdYNeDtOku1udseLK8q/4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QMHKo4+GbqWZE/AaoSJOke1qkx7azyAnSmtf63O/fB+7p0MegG+snQ3uI3aDmt55ZBjUXismANk3LnK4xrxkBtXWBgYgk7TzWlJGLdKq3u4efBy5hp4Qzz0gbbkf9tKkMiRSGGnmUM94sJNw6ZR7zB51l9uNM7f//9RX5nUv5wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=boMrmV8N; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778575937; x=1810111937;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=BCrJOeW+G/hzkswZS9tEKFKdYNeDtOku1udseLK8q/4=;
  b=boMrmV8NU5BaKy5u3pf6YCYjIVoM/PSKKguNmBB3LDoSxjDDT3b83TmG
   YU6/lR3ttGXNZ+ubJ6NT/0Pf59WxPpaUciX26lmBxUlwzWCmt38gX8sbO
   3CH9Il/PMS53kBx94xXjXKkV9wtDDKjRzAuA8SqLrtsEKqyL0xgmb70Tf
   P+ItC6keCnkLb1JbgNDyYYqojf2R93ejvEU98iTKjsU33Vv5g/V2gwnxf
   JAl2TZ3DFlwv25Y/OiDNHtL5MCtJn+DzXRY2cqJkTq5KiKUWZ3ZbX1yYV
   E2Xh24vknIDQB90nVIeUxNkutvkN6tmdiXVzHyOQow4KN/TELi5mLRMae
   w==;
X-CSE-ConnectionGUID: UaZbDyTtR8CkRmF0/3e2ow==
X-CSE-MsgGUID: 0XMUP6FWQteANDrQD3ycDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="90579647"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="90579647"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 01:52:11 -0700
X-CSE-ConnectionGUID: 0eQ/XthhQ4+Io0O/lG9F1Q==
X-CSE-MsgGUID: rmp/zjQ2Q8WNnbKtf6yRAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="239541384"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.158])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 01:52:07 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Manuel Ebner <manuelebner@mailbox.org>, manuelebner@mailbox.org
Cc: andy.shevchenko@gmail.com, apw@canonical.com, corbet@lwn.net,
 dwaipayanray1@gmail.com, joe@perches.com, kees@kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 lukas.bulwahn@gmail.com, skhan@linuxfoundation.org,
 workflows@vger.kernel.org
Subject: Re: [PATCH 1/2] Doc: deprecated.rst: add strlcat()
In-Reply-To: <20260510165451.57674-2-manuelebner@mailbox.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260510164907.57176-2-manuelebner@mailbox.org>
 <20260510165451.57674-2-manuelebner@mailbox.org>
Date: Tue, 12 May 2026 11:52:05 +0300
Message-ID: <748c2c3d549740918e14f29aa25dd475b99c1313@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: 3441951D137
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,canonical.com,lwn.net,perches.com,kernel.org,vger.kernel.org,linuxfoundation.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-87053-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jani.nikula@intel.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mailbox.org:email]
X-Rspamd-Action: no action

On Sun, 10 May 2026, Manuel Ebner <manuelebner@mailbox.org> wrote:
> add strlcat and alternatives

You'd think it's the strlcat() definition that needs a comment above it
saying it's deprecated. I don't think folks really look at
deprecated.rst.

BR,
Jani.

>
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
> ---
>  Documentation/process/deprecated.rst | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/Documentation/process/deprecated.rst b/Documentation/process/deprecated.rst
> index fed56864d036..b8a65c19796c 100644
> --- a/Documentation/process/deprecated.rst
> +++ b/Documentation/process/deprecated.rst
> @@ -162,6 +162,12 @@ if a source string is not NUL-terminated. The safe replacement is strscpy(),
>  though care must be given to any cases where the return value of strlcpy()
>  is used, since strscpy() will return negative errno values when it truncates.
>  
> +strlcat()
> +---------
> +strlcat() must re-scan the destination string from the beginning on each
> +call (O(n^2) behavior). Alternatives are seq_buf_puts(), seq_buf_printf(),
> +snprintf() and scnprintf()
> +
>  %p format specifier
>  -------------------
>  Traditionally, using "%p" in format strings would lead to regular address

-- 
Jani Nikula, Intel

