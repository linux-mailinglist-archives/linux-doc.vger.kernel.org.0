Return-Path: <linux-doc+bounces-87127-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AN4cCuIxA2oA1gEAu9opvQ
	(envelope-from <linux-doc+bounces-87127-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 12 May 2026 15:57:54 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F58D521CC8
	for <lists+linux-doc@lfdr.de>; Tue, 12 May 2026 15:57:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8E8D7301E7FB
	for <lists+linux-doc@lfdr.de>; Tue, 12 May 2026 13:52:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ADF139A4BA;
	Tue, 12 May 2026 13:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GuXv+/WB"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA197397B0F;
	Tue, 12 May 2026 13:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778593916; cv=none; b=ZJQwgTWvqk4p8/cl+Zz8yfuPkedx1vVypdRtSAb+pqAf2OUC90Q8BF7T887LoUs6UydL66EFlfJULzeXQIc9t7pEFAcckZnE2iNvA8rA8gNj3bEGTBV9w6xwocfxNk59gGwkSGpEYjqJ5PfaEnOrceTArkXDJ1NY49HV5qWCzKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778593916; c=relaxed/simple;
	bh=4bcw/QGUCsKM8pagXrlTL8ZxHoSsmyHotb14LwtQjQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LMOYwpJ+iEKWn5NbPM2OkzfCGIkMDbWEsL0SPuNjED4Xk6vOP2Uh8WKCt9Jn+Kf5YEw72is/TUQVKX2lnERXF7ehTWxWQGhTcQuZzzcNdU8q5SqXMmNCYn2UtpYy2/7f2HmWPtYKAzPYVuqpwGSu0Jd5oDVr9rmJuw/Kb+xGIRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GuXv+/WB; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778593915; x=1810129915;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4bcw/QGUCsKM8pagXrlTL8ZxHoSsmyHotb14LwtQjQs=;
  b=GuXv+/WB+SZX/CIMUpXfCEvoQnr/OtMfOYzDPr/6efQl70MwIknTag9f
   aNm5uI0VPZ/zce6bH3Ralc5dp82GwiX0jtnWSXDFZfw8Dz4oMLknu0zg4
   7D1/JMnvsadanO/Dqc7ADDRR3Z+y5MQ42fLA1RwNKRcMA7byuGIFACqIU
   PpiFlxIIsCGAHQrS0hS5UTJwQf5mGiVbxe4StF0TBIqLB33pEkUNQwmPW
   LWXbe/bdBjgbVxhepj3gswbNBQl+KrKH1TrRDfLK9BDGix4Y9mCy1GPcp
   EOT1fxFZvmuRLC5dOdG4lAQaDGbkG0zRiv2vXCh5sKCVKUVimTo+6m91L
   A==;
X-CSE-ConnectionGUID: +hMD+UZaSru3Pf1sFuN1Eg==
X-CSE-MsgGUID: iCD2IfMWTsKN8Ifbl+ertA==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79522657"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="79522657"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 06:51:53 -0700
X-CSE-ConnectionGUID: Dctv8Xt5Q4Kc5w4usCacQA==
X-CSE-MsgGUID: sSCSRKpDQuSjk/8GaOdg1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="236917194"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.112])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 06:51:47 -0700
Date: Tue, 12 May 2026 16:51:45 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: rodrigo.alencar@analog.com
Cc: linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v12 03/11] lib: test-kstrtox: tests for kstrtodec64() and
 kstrtoudec64()
Message-ID: <agMwcZUD0cwcJZFv@ashevche-desk.local>
References: <20260510-adf41513-iio-driver-v12-0-34af2ed2779f@analog.com>
 <20260510-adf41513-iio-driver-v12-3-34af2ed2779f@analog.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260510-adf41513-iio-driver-v12-3-34af2ed2779f@analog.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: 4F58D521CC8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-87127-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email,intel.com:dkim]
X-Rspamd-Action: no action

On Sun, May 10, 2026 at 01:42:21PM +0100, Rodrigo Alencar via B4 Relay wrote:

> Add tests for decimal parsing helpers kstrtodec64() and kstrtoudec64().
> The test infrastructure is reused from other kstrto*() functions, i.e.,
> the decimal parsers have fixed base of 10, so base field is used as
> scale input for the helpers.

I think I gave you a tag at some point, but in case I'm mistaken here we are
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



