Return-Path: <linux-doc+bounces-78423-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOxYIjeArmlfFQIAu9opvQ
	(envelope-from <linux-doc+bounces-78423-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 09 Mar 2026 09:09:27 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9107223552B
	for <lists+linux-doc@lfdr.de>; Mon, 09 Mar 2026 09:09:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0ED85302C173
	for <lists+linux-doc@lfdr.de>; Mon,  9 Mar 2026 08:04:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A62536C580;
	Mon,  9 Mar 2026 08:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cwdPXbQp"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BA136CDE5;
	Mon,  9 Mar 2026 08:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773043454; cv=none; b=jhqPD+tWIgnpn/lP5rPRzaqLQeZvpazC1sYBgZEpkBD3/Zhd39mkcPNyAAkOqsz1bRpyUlXJOtsNt9NG3Ymx5gPKxyKauJXd9yzdEGRK9eSkaSOy8EoGJg7K0YYv4uOl5cJVrohljwzcoTWFRIKX8HcCXyd2aN0zJCfXTEYmkxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773043454; c=relaxed/simple;
	bh=X0tGs7O6QiGQrhYYpAs9gFpBAMdmWTPYXOMZQs/6F64=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=tkYTelF6P5cSAelWJSccNf7Xt76MG0nsbtXCqLIs89dq/1PCIph6KbeE2FDPFUBPc3V5TXSzXRwCRW4ajhch6BMCX3fYCsmhp08+68ECdYqAvX3ufRm0HU+czG3T36PI1rz7gfWN/Gl+eRe6Pfl/w3co0MO7Po0jzNKwW+0N3dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cwdPXbQp; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773043453; x=1804579453;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=X0tGs7O6QiGQrhYYpAs9gFpBAMdmWTPYXOMZQs/6F64=;
  b=cwdPXbQpe+6gq5ESofzLDrMFQCjRVY8dtaKJj4wmMRB/4a9HK/BJxRz2
   rO590wh8AsU3WNY3D6+KRk5CNNdg7/uTO/z0PAx4ZQ1Kq6ueD/VvPjfno
   bPOTrMPN6NzRmzS17ICCOFAF7QATvSunuUT8OwoUypq2ETUszrNBw0Ubu
   lGcAZceogq5bBVynyxcXW8+5aDWfB+RU2R5jZ/m0DSUpUfhumm2SpuOzH
   ZgrrGG8+g9apIEYvIheOP7W/epKx0ko2bOd3cculiWhEHr14bgnf+m5vN
   Gm6mOkwV31TaL0hXt4PTYNSsBlfuOjExF/XepFHoO1JIIVU7PJhoUxTNP
   Q==;
X-CSE-ConnectionGUID: Q9e1zHmsRzinjPk2w2AW8A==
X-CSE-MsgGUID: xmo4nqPxQEehP06ZFT9ubw==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="74105487"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="74105487"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 01:04:02 -0700
X-CSE-ConnectionGUID: +L2ubFWOR3yT7PUUUDn4+A==
X-CSE-MsgGUID: wfr1KBATQeagsjDEmfx/tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="224138855"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.153])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 01:03:58 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 9 Mar 2026 10:03:53 +0200 (EET)
To: Vishnu Sankar <vishnuocv@gmail.com>
cc: Mark Pearson <mpearson-lenovo@squebb.ca>, dmitry.torokhov@gmail.com, 
    hmh@hmh.eng.br, Hans de Goede <hansg@kernel.org>, corbet@lwn.net, 
    derekjohn.clark@gmail.com, linux-input@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, ibm-acpi-devel@lists.sourceforge.net, 
    linux-doc@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
    vsankar@lenovo.com
Subject: Re: [PATCH v7 3/3] Documentation: thinkpad-acpi - Document
 doubletap_enable attribute
In-Reply-To: <20260209063355.491189-4-vishnuocv@gmail.com>
Message-ID: <991f8a08-7c5d-5611-7904-6c5d336a74a3@linux.intel.com>
References: <20260209063355.491189-1-vishnuocv@gmail.com> <20260209063355.491189-4-vishnuocv@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 9107223552B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-78423-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[squebb.ca,gmail.com,hmh.eng.br,kernel.org,lwn.net,vger.kernel.org,lists.sourceforge.net,lenovo.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ilpo.jarvinen@linux.intel.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-0.991];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,intel.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Mon, 9 Feb 2026, Vishnu Sankar wrote:

> Document the doubletap_enable sysfs attribute for ThinkPad ACPI driver.
> 
> Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
> ---

> +        * 1 - doubletap events are processed (default)
> +	* 0 - doubletap events are filtered out (ignored)

There's something odd in space vs tab here.

-- 
 i.


