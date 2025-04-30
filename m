Return-Path: <linux-doc+bounces-44978-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D627FAA559E
	for <lists+linux-doc@lfdr.de>; Wed, 30 Apr 2025 22:36:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 92F1D3B908F
	for <lists+linux-doc@lfdr.de>; Wed, 30 Apr 2025 20:36:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2A5C299518;
	Wed, 30 Apr 2025 20:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="auGpsgqf"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5B3296FD2
	for <linux-doc@vger.kernel.org>; Wed, 30 Apr 2025 20:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746045390; cv=none; b=Ka98ZXUcVxjbC0SSDjrF4XKMkJnMVJEwFdBLVKU+w4qZ+m4iljlcTmkcz5Zd4JPV8FfF8YppZmAYuwZA8LdBvhmXZImlR7WNJ1Pg5ppDNER5rPnasVgMkljNNuBvv0VPQgdcN6XUnAbzuNs3hTQO6U5Gz2FglPc1mmetiGbN4Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746045390; c=relaxed/simple;
	bh=OkvAncxtz1QXDNV3T2qsCYu1k+4q53HmbKjtlHkx914=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jyOj6ClUV1ruZcHHLj3PgV9LDrscNqmG3GJellmjQggiml99G2M6fisTiXPuWH3Bz7Rr2ep/kGEmpGFt6cfizeyiN3GuruW00W4M28jC/bnNteq1+66colIIOawx8TMpe7jOM6RqIjmOU68wLJIMo6BkWQk0+Sv5x3pNytYgsjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=auGpsgqf; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746045388; x=1777581388;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OkvAncxtz1QXDNV3T2qsCYu1k+4q53HmbKjtlHkx914=;
  b=auGpsgqfTbB/8L98f2hqaFk/oFSTM4gsgBVG1ow20eT4bFL/vqOX5JjE
   D3kVPwKhkHTxnCBRPPzpUeD51MHOhZK8J3bwKP2CFQak5bpPsoRaw483G
   ybhGsFHo9xNJJH++DbMPTRVIT47jKXeJbmzaROnCdqIS/HtvMxEG9yivQ
   r9WCVJC3bSisjDa6/vXpXIrM0PtmJbwFZeRgvTJ1drxrA5QueiZ3P4ueG
   fFAyuXQBPej5II7r89zkwDPa57RCyZl5TFUsxEgPoLWuw7qZH9x5yWU5O
   Luk40ZWgIOAu9lVXUOAgMdcJmz02ek1FEziNoITi8E6+z6r6qkcxXkRRB
   g==;
X-CSE-ConnectionGUID: kUmKvFapQseeOorflJMesA==
X-CSE-MsgGUID: 9lVENl6aTeyIvVVLvpM3wg==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="57919211"
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; 
   d="scan'208";a="57919211"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 13:36:27 -0700
X-CSE-ConnectionGUID: 85OlLEPuQSqKGar4dUM+0w==
X-CSE-MsgGUID: 7PxFLoRlTwy9Rltz6l3mhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; 
   d="scan'208";a="134515926"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 30 Apr 2025 13:36:25 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAEAJ-0003kn-15;
	Wed, 30 Apr 2025 20:36:23 +0000
Date: Thu, 1 May 2025 04:36:20 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev, Gregory Price <gourry@gourry.net>,
	linux-doc@vger.kernel.org
Subject: [gourryinverse:gourry_cxl_docs 19/19] htmldocs: Warning:
 Documentation/driver-api/cxl/linux/access-coordinates.rst references a file
 that doesn't exist: Documentation/driver-api/cxl/platform/acpi/acpi/cedt.rst
Message-ID: <202505010400.kB2mcx23-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gourryinverse/linux gourry_cxl_docs
head:   71923a8a0d05e8cf00f71c5cb6445c1772ea8f2c
commit: 71923a8a0d05e8cf00f71c5cb6445c1772ea8f2c [19/19] cxl: docs - add self-referencing cross-links
reproduce: (https://download.01.org/0day-ci/archive/20250501/202505010400.kB2mcx23-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505010400.kB2mcx23-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/userspace-api/netlink/netlink-raw.rst: :doc:`rt_link<../../networking/netlink_spec/rt_link>`
   Documentation/userspace-api/netlink/netlink-raw.rst: :doc:`tc<../../networking/netlink_spec/tc>`
   Documentation/userspace-api/netlink/netlink-raw.rst: :doc:`tc<../../networking/netlink_spec/tc>`
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
>> Warning: Documentation/driver-api/cxl/linux/access-coordinates.rst references a file that doesn't exist: Documentation/driver-api/cxl/platform/acpi/acpi/cedt.rst
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
   Warning: Documentation/translations/ja_JP/SubmittingPatches references a file that doesn't exist: linux-2.6.12-vanilla/Documentation/dontdiff
   Warning: Documentation/translations/ja_JP/process/submit-checklist.rst references a file that doesn't exist: Documentation/translations/ja_JP/SubmitChecklist
   Warning: Documentation/translations/zh_CN/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

