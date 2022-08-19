Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7347E59A430
	for <lists+linux-doc@lfdr.de>; Fri, 19 Aug 2022 20:05:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351027AbiHSR2I (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 19 Aug 2022 13:28:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354499AbiHSR1r (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 19 Aug 2022 13:27:47 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B5B412A557;
        Fri, 19 Aug 2022 09:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660927576; x=1692463576;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bl9OCZ9rTh7mupjI5GJBsM+uFuhOdCrvwO/1N9PwhhE=;
  b=McF+8Px2HcnRAnNWh3a3eHbH1T1UDycwgmlAE0ePjm6UTEsYKaF72EMS
   tzwnd67JsMfro4OV6Tx+tbthK1GOTAzqQNdDxpu73HkHP3z/IVC5UtMtj
   2mx6OryesnMnfMfaC+AfRv8TqqD+pbqG03/uLCt6tZiVhgtp8MEXSOZG4
   mJjoV3VqDvdoA/q0K8VCy8FB2BmDnCI9FAs6TEeTvq5hmiuI2j4e2SlZy
   bD8CoqKus1xgmJ4OOJxHmdKIVaP3bhStIJseqqwqv9Z/1jAmlWhR2RAP6
   0BWn36GJQDyOM1hHjTZhESWD98xmrB6zQr0pagiT1rVk5C4gHKkDu06Zt
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10444"; a="290621623"
X-IronPort-AV: E=Sophos;i="5.93,248,1654585200"; 
   d="scan'208";a="290621623"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2022 09:45:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,248,1654585200"; 
   d="scan'208";a="697615179"
Received: from lkp-server01.sh.intel.com (HELO 44b6dac04a33) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 19 Aug 2022 09:45:05 -0700
Received: from kbuild by 44b6dac04a33 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oP57I-0001dv-1L;
        Fri, 19 Aug 2022 16:45:04 +0000
Date:   Sat, 20 Aug 2022 00:44:34 +0800
From:   kernel test robot <lkp@intel.com>
To:     Oleksij Rempel <o.rempel@pengutronix.de>,
        Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Russell King <linux@armlinux.org.uk>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     kbuild-all@lists.01.org, netdev@vger.kernel.org,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        kernel@pengutronix.de, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
        David Jander <david@protonic.nl>
Subject: Re: [PATCH net-next v1 7/7] ethtool: add interface to interact with
 Ethernet Power Equipment
Message-ID: <202208200039.UVzayOII-lkp@intel.com>
References: <20220819120109.3857571-8-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220819120109.3857571-8-o.rempel@pengutronix.de>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Oleksij,

I love your patch! Yet something to improve:

[auto build test ERROR on net-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Oleksij-Rempel/add-generic-PSE-support/20220819-200408
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git 268603d79cc48dba671e9caf108fab32315b86a2
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20220820/202208200039.UVzayOII-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/ac5a14669dbe6cac4972ff01ea6291d12152e78f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Oleksij-Rempel/add-generic-PSE-support/20220819-200408
        git checkout ac5a14669dbe6cac4972ff01ea6291d12152e78f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> make[3]: *** No rule to make target 'net/ethtool/pse.o', needed by 'net/ethtool/built-in.a'.
   make[3]: Target '__build' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
