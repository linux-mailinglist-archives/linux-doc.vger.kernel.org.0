Return-Path: <linux-doc+bounces-28710-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 007C49B1867
	for <lists+linux-doc@lfdr.de>; Sat, 26 Oct 2024 15:07:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A1DAF1F22EAD
	for <lists+linux-doc@lfdr.de>; Sat, 26 Oct 2024 13:07:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C42E4B641;
	Sat, 26 Oct 2024 13:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n4q4AIOA"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BB31D363A
	for <linux-doc@vger.kernel.org>; Sat, 26 Oct 2024 13:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729948027; cv=none; b=maTCfv5P5mJIuGZDU5eR+tNNIQ7Rhn81vXsF2890t9B/S+IrOkevn7FyUSTX64o5NNDFtMg48nKCTvjdxAqxkOi1nuVjkq1/7cxHsNqLDBOX+cs5XZz7IGmmplX/NrAUWhfitwYu8kOUNG0eZO5CTqzpQy8XdxNjF3sI4TQ4duc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729948027; c=relaxed/simple;
	bh=fwyCIOtOltcNcxqU74U2sep7MLo9f7+uWU1c/QHi7jg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i5JBRvmeWcrVC7IeGkHAbRQs0nE+uSQ5sp4SoWM3k0vmMdFt7ipj6w2Jmqx8H0cyuUQTqtE8QnMRjgTcQDfgnyPq9N9Ho9GphbOTRE3WH5PwCmJM9PbueRCKgvkld6DC9B9QUy0F4hyZiMulBCF+3sw+wsySOJcyVC0eHBxD0Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n4q4AIOA; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729948026; x=1761484026;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fwyCIOtOltcNcxqU74U2sep7MLo9f7+uWU1c/QHi7jg=;
  b=n4q4AIOAXksbStacMVvRhCZx7MZO495H1g02tVgoYfp8/qkl8LkwlUyG
   irLCKFU4KVFCUzEOerhw2hSVRMRyjWD/q0U7wI0j0SGwx1v++h8Z9rhif
   zOkJf4lgIDmTtAJIErmuckznw3tkRtHnIaTaJ2KbAKkBOKHXRy3RsugPw
   yQQAbCIenvhrrL29349iH/e5URa32Jvm2eZ0IpCHr1dXTp0HrtrmYNIJe
   fZbSubW3qAqKKDZ2QOTPqzDR+/JUDg/w2zVQKI+SuXXD/6iF532mNBGfb
   UimRmXrNlwCvcksA0gOFezqGbOFjYa3u7s6MHQivbRJcgtSuxU4f3ts2C
   w==;
X-CSE-ConnectionGUID: I5AGRUevSuOPOSj2MU5zFQ==
X-CSE-MsgGUID: hXffd/bnRkO8t0juJzboBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40149988"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="40149988"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 06:07:05 -0700
X-CSE-ConnectionGUID: c/QhpwqCTuiP9WYnzukBmg==
X-CSE-MsgGUID: bfleiZssT6er8JX0tDH5aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,235,1725346800"; 
   d="scan'208";a="81094392"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 26 Oct 2024 06:07:03 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4gVR-000Zg6-11;
	Sat, 26 Oct 2024 13:07:01 +0000
Date: Sat, 26 Oct 2024 21:06:47 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	"Rob Herring (Arm)" <robh@kernel.org>, linux-doc@vger.kernel.org
Subject: [srini-nvmem:for-6.13 5/5] htmldocs: Warning:
 Documentation/devicetree/bindings/nvmem/zii,rave-sp-eeprom.yaml references a
 file that doesn't exist:
 Documentation/devicetree/bindings/mfd/zii,rave-sp.yaml
Message-ID: <202410262136.eJzeQwM2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/srini/nvmem.git for-6.13
head:   17d6f058403d4e3458ec9c7dae607c065cabe089
commit: 17d6f058403d4e3458ec9c7dae607c065cabe089 [5/5] dt-bindings: nvmem: convert zii,rave-sp-eeprom.txt to yaml format
reproduce: (https://download.01.org/0day-ci/archive/20241026/202410262136.eJzeQwM2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410262136.eJzeQwM2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/userspace-api/netlink/netlink-raw.rst: :doc:`rt_link<../../networking/netlink_spec/rt_link>`
   Documentation/userspace-api/netlink/netlink-raw.rst: :doc:`tc<../../networking/netlink_spec/tc>`
   Documentation/userspace-api/netlink/netlink-raw.rst: :doc:`tc<../../networking/netlink_spec/tc>`
>> Warning: Documentation/devicetree/bindings/nvmem/zii,rave-sp-eeprom.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/zii,rave-sp.yaml
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
   Warning: Documentation/userspace-api/netlink/index.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst
   Warning: Documentation/userspace-api/netlink/specs.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/reserved-memory/qcom

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

