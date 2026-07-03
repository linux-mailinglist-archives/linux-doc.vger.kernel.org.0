Return-Path: <linux-doc+bounces-94747-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JMPaAWphR2reXQAAu9opvQ
	(envelope-from <linux-doc+bounces-94747-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 09:14:50 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 993A36FF753
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 09:14:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b="c4gOW/m2";
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94747-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94747-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EAF67304455E
	for <lists+linux-doc@lfdr.de>; Fri,  3 Jul 2026 07:10:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 391F933F5BC;
	Fri,  3 Jul 2026 07:10:46 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C854388885
	for <linux-doc@vger.kernel.org>; Fri,  3 Jul 2026 07:10:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783062646; cv=none; b=nPvS8XWVb+6vLtC16Efyxyf2VQ5hIaOiIfc3FIAhyDCgRwn+uxgFV3NKxzFiGk5X9qEfUms10G7qMP64mPmzfhOSPdmfUYsBIZum5ymABHHahEYFT7vlT6pBC8rNlg7T1B8oTRxBbZtnze2Y3iDQYuY5GWQIWLE3RFef1zph8PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783062646; c=relaxed/simple;
	bh=8M7DUN2ktn6a5nj9IxKRy0Q44WVnBZ/IMSFwuTbfcN8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mcjXKqOlSYvYlMfnSTDD9xpa3mvg67cQjbmivpKfFYgd3qIR7r4SkjwUn/g+gPxOXOy1xE1NoDi9PDdjU20MKfHd3MgmQcaQb0hAfjwHt8HFGlKI09jc57vNV1OVelyttZxHeB6BjCxfvKHXMs8C9yLP7KTnRZBvZ0CZWy3R9nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c4gOW/m2; arc=none smtp.client-ip=192.198.163.18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783062644; x=1814598644;
  h=date:from:to:cc:subject:message-id;
  bh=8M7DUN2ktn6a5nj9IxKRy0Q44WVnBZ/IMSFwuTbfcN8=;
  b=c4gOW/m2uqmAODBCyaYEvD+rlUWcuc+GoDoX00tbII854dV0Tdqhl+XI
   XuwN9JBTdgGKyy6hyQD7gZ1LDxkYmee2v7HGbj2V0vbwXjD0WRUcOZRWz
   dM94f9MVcbpdeD3Cp8UA4mijuDW26/OeKeampx6+qKPL4jRnILD1VFAUx
   8IIzE/BUmfjMT3r0d+B2r4e9JfyKXXXp4Wc9tAYMCHtXdjuuXXaK61MqL
   IPMEijQrW1jMr8UwYdklh6eoU9HU9M10vAsEZ8IMqldmCIh5bqjEZ6HhZ
   KMGkfmEABnM0Qtu/TmaTGcvPpVqmJHDYxaiJ80mCd5H8VpIpFBHIBD+wi
   g==;
X-CSE-ConnectionGUID: g6vs2dJ+T22zfvAG+fHXiA==
X-CSE-MsgGUID: jnxQWaOUQYmZzkJ94gQOVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="82920734"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="82920734"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 00:10:43 -0700
X-CSE-ConnectionGUID: 3dbzONjCQEy1GWDvft8Ygg==
X-CSE-MsgGUID: JIoJFEksRMugoHcgn0+Elw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="283139757"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 03 Jul 2026 00:10:41 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfY2o-000000001RV-154H;
	Fri, 03 Jul 2026 07:10:38 +0000
Date: Fri, 03 Jul 2026 09:09:43 +0200
From: kernel test robot <lkp@intel.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 Mamta Shukla <mamta.shukla@leica-geosystems.com>,
 linux-doc@vger.kernel.org
Subject: htmldocs:
 Documentation/ABI/testing/sysfs-driver-input-touchnetix-axiom:63: WARNING:
 Block quote ends without a blank line; unexpected unindent. [docutils]
Message-ID: <202607030916.GmKrmmLs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94747-lists,linux-doc=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:m.felsch@pengutronix.de,m:oe-kbuild-all@lists.linux.dev,m:lkp@intel.com,m:mamta.shukla@leica-geosystems.com,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[lkp@intel.com,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,intel.com:from_mime,intel.com:email,intel.com:mid,intel.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 993A36FF753

tree:   https://github.com/intel-lab-lkp/linux/commits/Marco-Felsch/firmware_loader-expand-firmware-error-codes-with-up-to-date-error/20260703-063422
head:   0b2980db22d2384c1783f5302b968c8aea3abf3b
commit: 0b2980db22d2384c1783f5302b968c8aea3abf3b Input: Add TouchNetix aXiom I2C Touchscreen support
date:   8 hours ago
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260703/202607030916.GmKrmmLs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607030916.GmKrmmLs-lkp@intel.com/

All warnings (new ones prefixed by >>):

   WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:364; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:234
   WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode_index is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:373; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:243
   WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:636; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:252
   WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled_index is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:645; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:261
   Documentation/ABI/testing/sysfs-driver-input-touchnetix-axiom:63: ERROR: Unexpected indentation. [docutils]
>> Documentation/ABI/testing/sysfs-driver-input-touchnetix-axiom:63: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/ABI/testing/sysfs-driver-input-touchnetix-axiom:63: ERROR: Unexpected indentation. [docutils]
>> Documentation/ABI/testing/sysfs-driver-input-touchnetix-axiom:63: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/ABI/testing/sysfs-class-power-bd71828:1: ERROR: Malformed table.
   No bottom table border found.


vim +63 Documentation/ABI/testing/sysfs-driver-input-touchnetix-axiom

  > 63	What:		/sys/bus/i2c/devices/xxx/device_state

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

