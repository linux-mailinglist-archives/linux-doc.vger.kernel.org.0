Return-Path: <linux-doc+bounces-361-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7B17CB705
	for <lists+linux-doc@lfdr.de>; Tue, 17 Oct 2023 01:32:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2BE9F1F229A1
	for <lists+linux-doc@lfdr.de>; Mon, 16 Oct 2023 23:32:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F049A38FAC;
	Mon, 16 Oct 2023 23:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cw38NwSs"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8B837C93
	for <linux-doc@vger.kernel.org>; Mon, 16 Oct 2023 23:31:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACFFD92
	for <linux-doc@vger.kernel.org>; Mon, 16 Oct 2023 16:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697499116; x=1729035116;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eNbRQW2iB6+4kzJCGAbI7NdnTUt5G2A3IMbD6RO+JPA=;
  b=Cw38NwSsP4ko90RgR6hmIapiSVGyQRiwlQK/0W5AAIWeDCxRgu3QJNVg
   +EqxqBKfMNj++O80CmBob+gIaro4bk4vhy2LoL+qotwKnQCb6hhoFgbl8
   4Wjwldy4KWU4uky0fYiq8gtM91eJLstRUFJhrSKyvPNVZPyn4jYIiCH7T
   gNGa8wp/0CB6Db6vCOKBILMpDqfJ87QVmhPkY9suaC2bV/ju4Dog8Vsmy
   xmc77XEfl0Uu8TtS//ple6sVJHB2niE1SzsVuRMAaEUfDYalMLsifCHMV
   ai9rwEGt5h9z7XZdEy8S06nbO+1XymtNmKOwv6aG9qw+N0PsVtCW6OSKg
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="388522220"
X-IronPort-AV: E=Sophos;i="6.03,230,1694761200"; 
   d="scan'208";a="388522220"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 16:31:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,230,1694761200"; 
   d="scan'208";a="3696148"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 16 Oct 2023 16:30:49 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsX3v-0008kt-2a;
	Mon, 16 Oct 2023 23:31:51 +0000
Date: Tue, 17 Oct 2023 07:30:52 +0800
From: kernel test robot <lkp@intel.com>
To: Satya Priya <quic_c_skakit@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Steev Klimaszewski <steev@kali.org>,
	Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>, linux-doc@vger.kernel.org
Subject: [steev:lenovo-x13s-v6.6.0-rc5 28/73] dtbs_check:
 Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml:109:11: [error]
 string value is redundantly quoted with any quotes (quoted-strings)
Message-ID: <202310170724.yMaU0AfK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="eyrgKFrk+eR1kiqF"
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net


--eyrgKFrk+eR1kiqF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux lenovo-x13s-v6.6.0-rc5
head:   f407eddf8f89860256c17f85550631263581079b
commit: 0b14c61fb14567184b9e5372938a406d397d4fe0 [28/73] dt-bindings: mfd: pm8008: Add regulators for pm8008
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce:

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310170724.yMaU0AfK-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml:109:11: [error] string value is redundantly quoted with any quotes (quoted-strings)

vim +109 Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml

     8	
     9	maintainers:
    10	  - Guru Das Srinagesh <quic_gurus@quicinc.com>
    11	
    12	description: |
    13	  Qualcomm Technologies, Inc. PM8008 is a dedicated camera PMIC that integrates
    14	  all the necessary power management, housekeeping, and interface support
    15	  functions into a single IC.
    16	
    17	properties:
    18	  compatible:
    19	    const: qcom,pm8008
    20	
    21	  reg:
    22	    description:
    23	      I2C slave address.
    24	
    25	    maxItems: 1
    26	
    27	  interrupts:
    28	    maxItems: 1
    29	
    30	    description: Parent interrupt.
    31	
    32	  "#interrupt-cells":
    33	    const: 2
    34	
    35	    description: |
    36	      The first cell is the IRQ number, the second cell is the IRQ trigger
    37	      flag. All interrupts are listed in include/dt-bindings/mfd/qcom-pm8008.h.
    38	
    39	  interrupt-controller: true
    40	
    41	  "#address-cells":
    42	    const: 2
    43	
    44	  "#size-cells":
    45	    const: 0
    46	
    47	  reset-gpios:
    48	    maxItems: 1
    49	
    50	  vdd_l1_l2-supply:
    51	    description: Input supply phandle of ldo1 and ldo2 regulators.
    52	
    53	  vdd_l3_l4-supply:
    54	    description: Input supply phandle of ldo3 and ldo4 regulators.
    55	
    56	  vdd_l5-supply:
    57	    description: Input supply phandle of ldo5 regulator.
    58	
    59	  vdd_l6-supply:
    60	    description: Input supply phandle of ldo6 regulator.
    61	
    62	  vdd_l7-supply:
    63	    description: Input supply phandle of ldo7 regulator.
    64	
    65	patternProperties:
    66	  "^gpio@0,[0-9a-f]+$":
    67	    type: object
    68	
    69	    description: |
    70	      The GPIO peripheral. This node may be specified twice, one for each GPIO.
    71	
    72	    properties:
    73	      compatible:
    74	        items:
    75	          - const: qcom,pm8008-gpio
    76	          - const: qcom,spmi-gpio
    77	
    78	      reg:
    79	        description: Peripheral offset and address of one of the two GPIO peripherals.
    80	        maxItems: 1
    81	
    82	      gpio-controller: true
    83	
    84	      gpio-ranges:
    85	        maxItems: 1
    86	
    87	      interrupt-controller: true
    88	
    89	      "#interrupt-cells":
    90	        const: 2
    91	
    92	      "#gpio-cells":
    93	        const: 2
    94	
    95	    required:
    96	      - compatible
    97	      - reg
    98	      - gpio-controller
    99	      - interrupt-controller
   100	      - "#gpio-cells"
   101	      - gpio-ranges
   102	      - "#interrupt-cells"
   103	
   104	    additionalProperties: false
   105	
   106	  "^ldo[1-7]@[1],[0-9a-f]+$":
   107	    type: object
   108	
 > 109	    $ref: "/schemas/regulator/regulator.yaml#"
   110	
   111	    description: PM8008 regulator peripherals of PM8008 regulator device.
   112	
   113	    properties:
   114	      compatible:
   115	        const: qcom,pm8008-regulator
   116	
   117	      reg:
   118	        description: Peripheral offset and address of the ldo regulator.
   119	        maxItems: 1
   120	
   121	    required:
   122	      - compatible
   123	      - reg
   124	
   125	    unevaluatedProperties: false
   126	
   127	required:
   128	  - compatible
   129	  - reg
   130	  - interrupts
   131	  - "#address-cells"
   132	  - "#size-cells"
   133	  - "#interrupt-cells"
   134	  - reset-gpios
   135	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

--eyrgKFrk+eR1kiqF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=reproduce

reproduce: make ARCH=loongarch dtbs_check

--eyrgKFrk+eR1kiqF--

