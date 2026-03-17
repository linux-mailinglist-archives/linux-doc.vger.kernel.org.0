Return-Path: <linux-doc+bounces-79792-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGCiGWuJuWmTJAIAu9opvQ
	(envelope-from <linux-doc+bounces-79792-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 17 Mar 2026 18:03:39 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2725A2AED9A
	for <lists+linux-doc@lfdr.de>; Tue, 17 Mar 2026 18:03:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5EF43300CFFA
	for <lists+linux-doc@lfdr.de>; Tue, 17 Mar 2026 17:03:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 711053F54DD;
	Tue, 17 Mar 2026 17:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QKmC1GO1"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037213F54D9;
	Tue, 17 Mar 2026 17:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773766997; cv=none; b=WnyLEqQpPKghjDjsA2YV1T7EPe9tq8lyrmC/D39bR4lhSWzdIv5mBVGt8N7WTljsJMp1p/0p7j075dYmUXVmb5MDDbrCqZlAM64gwucoIzFQPKU7wcCtCAmYpjV0E1zkgO9j7J91D7qW5VDnFv1OBBThKxKm0pERv7WPTwY6hLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773766997; c=relaxed/simple;
	bh=R99pd5idc1J6vFPoSB3qSz7mHfrDv+Kwq/74+/Gmp1A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Uszn0HOswz60B4BRQ+yg9MruE+xnmoYtIUm23k+liDsgzFcRNyZ1dpgFjbdNmEmW8hDI8RPg+CZfAPgPvZ2/Ori/HcPnVLZiDi2VIPLSW4qQgqVD9+ssjNt+nRVbxXPbh6Ik0dttkPkEraLQTuywp24oY9qigQE9rQIp6GXqg8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QKmC1GO1; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773766996; x=1805302996;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=R99pd5idc1J6vFPoSB3qSz7mHfrDv+Kwq/74+/Gmp1A=;
  b=QKmC1GO12S5TywUYcFiztpyYYlFI9nKLwFJFQK2NOnw/Mt53TrhQ07M5
   rhNtkZj8+9b2QfgUVdGn5BSCzAHuYtQ1M66FJKdqlx1g8SMpPMJHWiO0G
   uhFsZYtW9vU8PG7tVc+73yrK7AXcsMuGD5+Scz6ifQAUgSWtT3oYuTzNH
   oDrArWObARO47c+JMBJWzURa2CJizoQPL8EXV22Qn9apO6gz5UBn4DOiR
   tAOneASi2XBaUcTf2mCG/GWLhwaJc+e2JfRZDkygo9k+w6ivkUVvZg5gq
   w5chp46XjP8PbYbmFJuJO1+y6UKGrz55CKcw0gFcnyv0g3HTUc9IQwW+6
   w==;
X-CSE-ConnectionGUID: gt0hFIHdTmm+/nXHsQemsw==
X-CSE-MsgGUID: BSLI8b+GSx+ArGKHfdAlvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="85123000"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="85123000"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 10:03:15 -0700
X-CSE-ConnectionGUID: iJmUbPXkQbyBAfO2Wus5PA==
X-CSE-MsgGUID: Zu7Ql+mjQaSzFC56nqA22Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="226799524"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.161])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 10:03:09 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: mpearson-lenovo@squebb.ca, dmitry.torokhov@gmail.com, hmh@hmh.eng.br, 
 hansg@kernel.org, corbet@lwn.net, derekjohn.clark@gmail.com, 
 Vishnu Sankar <vishnuocv@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 ibm-acpi-devel@lists.sourceforge.net, linux-doc@vger.kernel.org, 
 platform-driver-x86@vger.kernel.org, vsankar@lenovo.com
In-Reply-To: <20260311143144.482145-1-vishnuocv@gmail.com>
References: <20260311143144.482145-1-vishnuocv@gmail.com>
Subject: Re: [PATCH v8 0/3] TrackPoint doubletap enablement and user
 control
Message-Id: <177376698425.15640.5695107795590543274.b4-ty@linux.intel.com>
Date: Tue, 17 Mar 2026 19:03:04 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-79792-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[squebb.ca,gmail.com,hmh.eng.br,kernel.org,lwn.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ilpo.jarvinen@linux.intel.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,linux.intel.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2725A2AED9A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 11 Mar 2026 23:31:41 +0900, Vishnu Sankar wrote:

> This patch series adds support for TrackPoint doubletap with a clear and
> simple separation of responsibilities between drivers:
> 
> 1. Firmware enablement (trackpoint.c):
>    Automatically enables doubletap on capable hardware during device
>    detection.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/3] input: trackpoint - Enable doubletap by default on capable devices
      commit: 9a98ebe630cf13c1a6063afa676d1cecc44fb2c9
[2/3] platform/x86: thinkpad_acpi: Add sysfs control for TrackPoint double-tap
      commit: 6227cc32fa01ffbf5bef8dcc6759743a28a2ad57
[3/3] Documentation: thinkpad-acpi - Document doubletap_enable attribute
      commit: fa5062e99b984448b7c8ca9aea47e7fc033b6e2f

--
 i.


