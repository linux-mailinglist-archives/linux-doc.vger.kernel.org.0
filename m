Return-Path: <linux-doc+bounces-74934-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPPcLYv/gGk6DgMAu9opvQ
	(envelope-from <linux-doc+bounces-74934-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 02 Feb 2026 20:48:27 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 41705D0B29
	for <lists+linux-doc@lfdr.de>; Mon, 02 Feb 2026 20:48:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8BA1A3005A9A
	for <lists+linux-doc@lfdr.de>; Mon,  2 Feb 2026 19:46:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C23C03090C2;
	Mon,  2 Feb 2026 19:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J2tlGt41"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352AD35972;
	Mon,  2 Feb 2026 19:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770061602; cv=none; b=QMtdjCUSL32ZAmXdkpk4bFFnDs9nWMlcb9chaauicsDr9XP/a3qYuFkml1mGgGbut+ZN94nyVIAoPWW2CM1wIMSTmwzlJikNEPDN09v/yDzBNu2zr6hMLfGbDDF5EFOpJtt51wBEHuSL2Wmwt0KqnB9HwA4vp2mhiL+ytzSIrbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770061602; c=relaxed/simple;
	bh=TFn5p17AdU+ewLx+yvi/Q6RCvsZQp4hixKeO8bgKD94=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CY84rHMX1xZ7+2CR2LuuVUT2hGX02EQohTl2kPijaPIA+/s3aP12Y0ITIgUzqUz8ALG7qH5U0gFUq62EtVty2aM9qdNnDzr/e3mOYP14NVrSklC6LeBDg3L4VCg2O7BEJWLpYbZCiKypolWCGMonJphVkNGrL/6vfSTw0ZpdtMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J2tlGt41; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770061601; x=1801597601;
  h=date:from:to:cc:subject:message-id;
  bh=TFn5p17AdU+ewLx+yvi/Q6RCvsZQp4hixKeO8bgKD94=;
  b=J2tlGt41jUVrktda54V3NN2WebzcVA3DtdeLMnmnoGwE8Edej5cjAvAv
   gYZa6auFnPwtmzxU4xy2juJT1GtC2guXsR/PHgWe9RooBozrO2B8lw32w
   rJYGPiRrAXBxGRvtn/Y7mI6Lv/2PfY7h8H4uIUnCPRrKYMHFacl6MsMwI
   OvRY7+s7gM2PZFJDcjCRu3alAR9Ud5F5X+imkq1rPmVWE8wd78oHLCMYN
   Kh9+IhGT8uCNJhuUV5r7p1vSlRyP03czz3OjwCpBHLlza+Wr2e322Dm6r
   Y6fDuRDxVqaDTC6M2CcPqDygz4CFIdw/xlXC00apDgYHIjHDNPB/nyNux
   A==;
X-CSE-ConnectionGUID: TSTWLS6ORwiPHriQ0vVmYQ==
X-CSE-MsgGUID: Mm8KtCQFS4iwIrpSINAl/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="88647301"
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; 
   d="scan'208";a="88647301"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2026 11:46:40 -0800
X-CSE-ConnectionGUID: aW8W4Ve8QX6fcnf0F3AIjA==
X-CSE-MsgGUID: TrBUZ3IWQXSs0UVeTcC7SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; 
   d="scan'208";a="208897697"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 02 Feb 2026 11:46:39 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmzsa-000000003Bt-2S4C;
	Mon, 02 Feb 2026 19:46:36 +0000
Date: Mon, 02 Feb 2026 20:45:38 +0100
From: kernel test robot <lkp@intel.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Subject: htmldocs: Documentation/driver-api/tty/tty_port.rst:65:
 WARNING: Document or section may not begin with a transition. [docutils]
Message-ID: <202602022007.fALe9bGB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-74934-lists,linux-doc=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,intel.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,01.org:url,linuxfoundation.org:email]
X-Rspamd-Queue-Id: 41705D0B29
X-Rspamd-Action: no action

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   18f7fcd5e69a04df57b563360b88be72471d6b62
commit: 00d95fcc4dee66dfb6980de6f2973b32f973a1eb docs: kdoc: handle the obsolescensce of docutils.ErrorString()
date:   5 months ago
reproduce: (https://download.01.org/0day-ci/archive/20260202/202602022007.fALe9bGB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602022007.fALe9bGB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   WARNING: No kernel-doc for file ./include/linux/tty_port.h
   ERROR: Cannot find file ./include/linux/tty_port.h
   WARNING: No kernel-doc for file ./include/linux/tty_port.h
   ERROR: Cannot find file ./include/linux/tty_port.h
   WARNING: No kernel-doc for file ./include/linux/tty_port.h
>> Documentation/driver-api/tty/tty_port.rst:65: WARNING: Document or section may not begin with a transition. [docutils]
   ERROR: Cannot find file ./include/linux/tty.h
   WARNING: No kernel-doc for file ./include/linux/tty.h
   ERROR: Cannot find file ./include/linux/tty.h
   WARNING: No kernel-doc for file ./include/linux/tty.h
   ERROR: Cannot find file ./include/linux/tty.h


vim +65 Documentation/driver-api/tty/tty_port.rst

3f19fed8d0daed Documentation/tty/tty_port.rst Jiri Slaby 2021-11-26  61  
3f19fed8d0daed Documentation/tty/tty_port.rst Jiri Slaby 2021-11-26  62  .. kernel-doc:: include/linux/tty_port.h
3f19fed8d0daed Documentation/tty/tty_port.rst Jiri Slaby 2021-11-26  63     :identifiers: tty_port
3f19fed8d0daed Documentation/tty/tty_port.rst Jiri Slaby 2021-11-26  64  
3f19fed8d0daed Documentation/tty/tty_port.rst Jiri Slaby 2021-11-26 @65  ----
3f19fed8d0daed Documentation/tty/tty_port.rst Jiri Slaby 2021-11-26  66  

:::::: The code at line 65 was first introduced by commit
:::::: 3f19fed8d0daed6e0e04b130d203d4333b757901 Documentation: add TTY chapter

:::::: TO: Jiri Slaby <jslaby@suse.cz>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

