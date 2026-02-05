Return-Path: <linux-doc+bounces-75385-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +A1VBKLOhGk45QMAu9opvQ
	(envelope-from <linux-doc+bounces-75385-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 05 Feb 2026 18:08:50 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 575F0F5ABE
	for <lists+linux-doc@lfdr.de>; Thu, 05 Feb 2026 18:08:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 127023037D79
	for <lists+linux-doc@lfdr.de>; Thu,  5 Feb 2026 17:02:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B0D241324C;
	Thu,  5 Feb 2026 17:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jRyDTggU"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C58723F417;
	Thu,  5 Feb 2026 17:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770310961; cv=none; b=KJek6NbUR552XwHiYahyZEyDVRg5Fr5e15cDnPKvVDpe2JH69cxoMARVLdD2iwCPwFDQj/+HkXa5p5l4vpwYVK/YpaBTceUEHFmg2+LsC46YpLfu8OfvNeBQQ1YHyi2hEH0dQTiU3NCQG2GeGg4Z13JZEhH9RQiavpkA3Pf6Tm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770310961; c=relaxed/simple;
	bh=xQGLJhS/UEsOHqsmRYkO81XAwEsnkUAHJd0vhBA+d/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b8AFQb40ksUkLRhhZUwCaHr8pukjGQlvnNgv/O6FbcQ8m5AfTNBOOIDWfiwMtbK6zYYsnXciQ806gpT3O81GMlfN9PAY4U2iFEcaaJsT1nkQeRvHD+Re9AwUKRgnFofUJX+bfImYS+DlsV8CWrSGynq/IJAoPjxxdvKe44iWgMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jRyDTggU; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770310961; x=1801846961;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xQGLJhS/UEsOHqsmRYkO81XAwEsnkUAHJd0vhBA+d/E=;
  b=jRyDTggUt2ceP+TJdo82uIEdMp5+hGlJfEhgsoQ0Ih5j/DX/1821dD0O
   RHozLJGGW7lm4pQV0SXE//ygu52NswkuC//GhWx/arUC3u9CbIn/iAIaO
   AaXh7AjXcgq/aeGUA2RnRy3V2944urSpM8yeGrBBiUFZ+m1My7Bo/iz/8
   pNqzgjMoFIGa4eWsjv6Nble5vrQpYmioVqAzWbTLIr0DkIWyT5Ewvsvp/
   bduKFb1m4jDkzQm/YLMpbCB9T+V4XKNPptGG5NKpELINAgw+39ZJsY/zD
   ser3zIcXWzczl76VYqrV3xRiSpGvd8ZxTHXBqYRHAaudt7m30OMFnmfzG
   Q==;
X-CSE-ConnectionGUID: g8GgsdPZS+qdI6t11FYGlQ==
X-CSE-MsgGUID: SgCN9VtGTIeOyZyZq7ghSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="70535124"
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; 
   d="scan'208";a="70535124"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 09:02:22 -0800
X-CSE-ConnectionGUID: snEnNZDiTfKXF3/4V8b30w==
X-CSE-MsgGUID: NRY8pCy2QUuK0Nqf9kDqsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; 
   d="scan'208";a="215561362"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.142])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 09:02:19 -0800
Date: Thu, 5 Feb 2026 19:02:16 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Marcelo Schmitt <marcelo.schmitt@analog.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	jic23@kernel.org, michael.hennerich@analog.com, nuno.sa@analog.com,
	eblanc@baylibre.com, dlechner@baylibre.com, andy@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	corbet@lwn.net, marcelo.schmitt1@gmail.com,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v7 4/8] iio: adc: ad4030: Use BIT macro to improve code
 readability
Message-ID: <aYTNGKPPfFRoEuW3@smile.fi.intel.com>
References: <cover.1770309522.git.marcelo.schmitt@analog.com>
 <ded44627458ceac33407f5a0bb0eb77419d60d48.1770309522.git.marcelo.schmitt@analog.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ded44627458ceac33407f5a0bb0eb77419d60d48.1770309522.git.marcelo.schmitt@analog.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,analog.com,baylibre.com,lwn.net,gmail.com];
	TAGGED_FROM(0.00)[bounces-75385-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,smile.fi.intel.com:mid]
X-Rspamd-Queue-Id: 575F0F5ABE
X-Rspamd-Action: no action

On Thu, Feb 05, 2026 at 01:48:19PM -0300, Marcelo Schmitt wrote:
> Use BIT macro to make the list of average modes more readable.

Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>

...

> +	BIT(0),

Maybe a comment here (yes, I read the top comment,
this is just for the sake of preventing regrouping
in the future).

	BIT(0),					/* No sampling average */

but again, no need to resend for this tiny thing.

> +	BIT(1), BIT(2), BIT(3), BIT(4),
> +	BIT(5), BIT(6), BIT(7), BIT(8),
> +	BIT(9), BIT(10), BIT(11), BIT(12),
> +	BIT(13), BIT(14), BIT(15), BIT(16),

-- 
With Best Regards,
Andy Shevchenko



