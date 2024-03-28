Return-Path: <linux-doc+bounces-12156-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D76A187CDA9
	for <lists+linux-doc@lfdr.de>; Fri, 15 Mar 2024 14:04:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0680A1C21FD0
	for <lists+linux-doc@lfdr.de>; Fri, 15 Mar 2024 13:04:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3372E25564;
	Fri, 15 Mar 2024 13:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HHbYhaFV"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF7A250FE
	for <linux-doc@vger.kernel.org>; Fri, 15 Mar 2024 13:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710507806; cv=none; b=T5Ob9FsOPPCPId56n0rJFDqUG1vt4tdGfncXv2d+stBQkNcPIyuoldVzAOhD7TPT0chbbpOYeuRP06/p1snCHI/IRv/04MqNJ/hVqXKQ+mnyy0bLwUImxmWtrnRyN4+hKOI3kTQuvF/zWkduvXszw+Vsoh/zZL2na9N5UUp3IVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710507806; c=relaxed/simple;
	bh=Y63dCiYY/jd1/axD3ocB8vQNF3D0IiWGjeqU5R4FaxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YVKM2dR7hNyeBI4a09MiGEmNbsqzT+bkqrhD7bJSbj6NiO/JSJwIir04FUw7rIBW2VlKgTCMXZVwr+eXdEBd1w/6WTURzkt4RI75PM/FuajaIhriXQUD/ZHADndQ/9IpRmia7RcrfNgeeNvip5Sw6oWGzlzEsmvUMVSqxDp4mB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HHbYhaFV; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710507804; x=1742043804;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y63dCiYY/jd1/axD3ocB8vQNF3D0IiWGjeqU5R4FaxQ=;
  b=HHbYhaFV+u5EUIE+pLMuaNSY46S227MrnflOz7mzvCy9Y+MxIkvnaEsx
   GMAwn+fEwToF65l9bsF1qANXCmJH19SMp9yMMT7cqe82fDFtO4RKtk4oK
   TiAL3g/74nBFio//lv7X6q6ZcBH4iwpsSAUC5X7Z979mR+1rhPaAKWmvy
   eH5KDbnJN6bDKEf1hn8LuFoystKwEy2G1NTxIb+TVJMdspCUrk5cEQgz4
   8D/tQw+2CAqRQHPSrPB1bKCVH3/6jNgAt9pe+ZrU4Rvf4r25tiJr5wCfM
   BaoWuhbAVwsbgZfO+S9RICwt4/xclCesXQvZZXJ6XbXNJQW4Lmciz2zin
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="5240208"
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; 
   d="scan'208";a="5240208"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2024 06:00:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; 
   d="scan'208";a="35790976"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 15 Mar 2024 06:00:08 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rl7AM-000ERj-11;
	Fri, 15 Mar 2024 13:00:06 +0000
Date: Fri, 15 Mar 2024 20:59:17 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev, Dongjin Kim <tobetter@gmail.com>,
	linux-doc@vger.kernel.org
Subject: [tobetter:odroid-6.8.y 6/50] dtbs_check:
 Documentation/devicetree/bindings/phy/rockchip-pcie3-phy.yaml:48:11: [error]
 string value is redundantly quoted with any quotes (quoted-strings)
Message-ID: <202403152025.hzk4yU7w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/tobetter/linux odroid-6.8.y
head:   acad72b08e300e6aef1322a1bfd2d7b2c42cd860
commit: 23ce72703c97767a67f18f8741aea82e7da51228 [6/50] dt-bindings: phy: rockchip: add pcie3 phy
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240315/202403152025.hzk4yU7w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403152025.hzk4yU7w-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/phy/rockchip-pcie3-phy.yaml:48:11: [error] string value is redundantly quoted with any quotes (quoted-strings)
--
>> Documentation/devicetree/bindings/phy/rockchip-pcie3-phy.yaml: More than one condition true in oneOf schema:
   	{'description': 'Either unevaluatedProperties or additionalProperties '
   	                'must be present',
   	 'oneOf': [{'required': ['unevaluatedProperties']},
   	           {'required': ['additionalProperties']}]}
   	hint: Either unevaluatedProperties or additionalProperties must be present
   	from schema $id: http://devicetree.org/meta-schemas/core.yaml#

vim +48 Documentation/devicetree/bindings/phy/rockchip-pcie3-phy.yaml

     8	
     9	maintainers:
    10	  - Heiko Stuebner <heiko@sntech.de>
    11	
    12	properties:
    13	  compatible:
    14	    enum:
    15	      - rockchip,rk3568-pcie3-phy
    16	      - rockchip,rk3588-pcie3-phy
    17	
    18	  reg:
    19	    maxItems: 2
    20	
    21	  clocks:
    22	    minItems: 1
    23	    maxItems: 3
    24	
    25	  clock-names:
    26	    contains:
    27	      anyOf:
    28	        - enum: [ refclk_m, refclk_n, pclk ]
    29	
    30	  "#phy-cells":
    31	    const: 0
    32	
    33	  resets:
    34	    maxItems: 1
    35	
    36	  reset-names:
    37	    const: phy
    38	
    39	  rockchip,phy-grf:
    40	    $ref: /schemas/types.yaml#/definitions/phandle
    41	    description: phandle to the syscon managing the phy "general register files"
    42	
    43	  rockchip,pipe-grf:
    44	    $ref: /schemas/types.yaml#/definitions/phandle
    45	    description: phandle to the syscon managing the pipe "general register files"
    46	
    47	  rockchip,pcie30-phymode:
  > 48	    $ref: '/schemas/types.yaml#/definitions/uint32'
    49	    description: |
    50	      use PHY_MODE_PCIE_AGGREGATION if not defined
    51	    minimum: 0x0
    52	    maximum: 0x4
    53	
    54	
    55	required:
    56	  - compatible
    57	  - reg
    58	  - rockchip,phy-grf
    59	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

