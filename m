Return-Path: <linux-doc+bounces-362-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 054AA7CB726
	for <lists+linux-doc@lfdr.de>; Tue, 17 Oct 2023 01:48:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88897281613
	for <lists+linux-doc@lfdr.de>; Mon, 16 Oct 2023 23:48:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52FD63AC03;
	Mon, 16 Oct 2023 23:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YSo2RZ0c"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94243AC02
	for <linux-doc@vger.kernel.org>; Mon, 16 Oct 2023 23:48:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5861CA2
	for <linux-doc@vger.kernel.org>; Mon, 16 Oct 2023 16:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697500086; x=1729036086;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rZ/cbzTKUre7lD4bMLiJlwnM0g3pUpXlQ5wSpbw5Qjw=;
  b=YSo2RZ0cz/tWUw/o4LlIUChrkMSu3jzJ59KY4LiCgyQ8TSxEtR5iYf9e
   VbGo6I5wiJ7PrqIwirfd3mXIJsy8uHLV5GH2dp5ZG4T5rbmoM4VQdGoG5
   A1LhrXXSYx0/XIdCcXvN2p/1ohDRcylfFCV/RqijXuxrX1aRgZViSROAU
   L1KUnEz+qYngGNdx/nAsdCIKfT6IQy/ADOe6RLdBj7ikp3mGeogKVAOQH
   xA2hCD1muXD3QnpXwfqVjS0ztVg9iQrSzly/aEZOwQSPIcdp7ZCoJX0tH
   7CDH7OARb1C6uNjUsRFmggCkgJpoNyAnAu3eYU7rK7sDxXoDzDBDT9PtS
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="449888252"
X-IronPort-AV: E=Sophos;i="6.03,230,1694761200"; 
   d="scan'208";a="449888252"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 16:48:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="846596102"
X-IronPort-AV: E=Sophos;i="6.03,230,1694761200"; 
   d="scan'208";a="846596102"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 16 Oct 2023 16:48:04 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsXJa-0008lL-0V;
	Mon, 16 Oct 2023 23:48:02 +0000
Date: Tue, 17 Oct 2023 07:47:51 +0800
From: kernel test robot <lkp@intel.com>
To: Jenny Manne <jenny.v.manne@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Hans Verkuil <hverkuil@xs4all.nl>,
	linux-doc@vger.kernel.org
Subject: [hverkuil-media-tree:hdmi-dbg 4/29] dtbs_check:
 Documentation/devicetree/bindings/iio/adc/ti,ads7128.yaml:42:1: [error]
 syntax error: found character '\t' that cannot start any token (syntax)
Message-ID: <202310170730.d2FwYaBp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

tree:   git://linuxtv.org/hverkuil/media_tree.git hdmi-dbg
head:   d344bfea2a3086931de23669e9fe7a73cf373bb3
commit: 3ccffba164ef0246aff8f810e17c9756c598c170 [4/29] ti-ads7128: driver for the TI ADS7128 ADC
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231017/202310170730.d2FwYaBp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310170730.d2FwYaBp-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/iio/adc/ti,ads7128.yaml:42:1: [error] syntax error: found character '\t' that cannot start any token (syntax)
--
>> Documentation/devicetree/bindings/iio/adc/ti,ads7128.yaml:42:1: found a tab character where an indentation space is expected
--
>> Documentation/devicetree/bindings/iio/adc/ti,ads7128.yaml: ignoring, error parsing file

vim +42 Documentation/devicetree/bindings/iio/adc/ti,ads7128.yaml

    32	
    33	examples:
    34	  - |
    35	    i2c {
    36	        #address-cells = <1>;
    37	        #size-cells = <0>;
    38	
    39	        adc@17 {
    40	            compatible = "ti,ads7128";
    41	            reg = <0x17>;
  > 42		    vref-supply = <&vref_5v0_reg>;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

