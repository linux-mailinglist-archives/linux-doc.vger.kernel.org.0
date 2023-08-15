Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EB0477C7DC
	for <lists+linux-doc@lfdr.de>; Tue, 15 Aug 2023 08:34:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233009AbjHOGdf (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 15 Aug 2023 02:33:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235167AbjHOGdQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Aug 2023 02:33:16 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9BDD819B9
        for <linux-doc@vger.kernel.org>; Mon, 14 Aug 2023 23:23:07 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id E016180E0;
        Tue, 15 Aug 2023 06:23:06 +0000 (UTC)
Date:   Tue, 15 Aug 2023 09:23:05 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     kernel test robot <lkp@intel.com>, Arnd Bergmann <arnd@arndb.de>
Cc:     Andreas Kemnade <andreas@kemnade.info>,
        oe-kbuild-all@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, arm@kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [soc:omap/maintainers 1/1] htmldocs: Warning: MAINTAINERS
 references a file that doesn't exist:
 Documentation/devicetree/bindings/arm/ti/omap.yaml
Message-ID: <20230815062305.GS11676@atomide.com>
References: <202308142025.Bua4jLjW-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202308142025.Bua4jLjW-lkp@intel.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

Adding Arnd as these branches are now in the arm-soc tree.

* kernel test robot <lkp@intel.com> [230814 13:06]:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git omap/maintainers
> head:   fda31904ffbc7231898198333804fa551b681387
> commit: fda31904ffbc7231898198333804fa551b681387 [1/1] MAINTAINERS: add board bindings list to OMAP2+ files
> reproduce: (https://download.01.org/0day-ci/archive/20230814/202308142025.Bua4jLjW-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202308142025.Bua4jLjW-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/arm/ti/omap.yaml

Looks like this is caused by pull request branch for "Devicetree binding
changes for omaps for v6.6" not being merged into pull request
branch "Maintainer file list update for omaps for v6.6".

Regards,

Tony
