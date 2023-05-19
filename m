Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D05D0709CAC
	for <lists+linux-doc@lfdr.de>; Fri, 19 May 2023 18:46:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229885AbjESQqY (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 19 May 2023 12:46:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbjESQqW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 19 May 2023 12:46:22 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E3E5D2;
        Fri, 19 May 2023 09:46:17 -0700 (PDT)
Received: from meer.lwn.net (unknown [IPv6:2601:281:8300:73::5f6])
        by ms.lwn.net (Postfix) with ESMTPA id 1098E6E3;
        Fri, 19 May 2023 16:46:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 1098E6E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1684514777; bh=joOVoaCe6s0h4lpsz+lfTwPzy6pyJXuF5rvKMxjptzc=;
        h=From:To:Cc:Subject:Date:From;
        b=Yk/a/Bq2T3glrHKvweVVQrMhcdV43t40z6wbcEQWkf/wMcL+sDSOEyKzGvfpRxttz
         ah2JOdpopui65/XGcf4vGPlcLWOVeODpCWYRhz8MyMND6GoBkDrVRNPNbNTIJDm+DZ
         HZ2AoVwPopHo+TZvtdYJX5CKfEfDfO1zyYUFWuwEJn7isyL3jZapQcOBrbxcOijmha
         1lrzej+AuAG9ZZYQSdQ9kRbcuzTwfpHGSIkyycZV+2f701m2nXg1PfLLwebQNtGAF8
         0vSLCrrZRS1A8i2mYw5fplelvjNXedqwBNH16488nVqpLrx0/DuvY/ZGQnjqlaCNuJ
         PY/n9dl5/yjRA==
From:   Jonathan Corbet <corbet@lwn.net>
To:     linux-doc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 0/7] docs: Move Documentation/arm under Documentation/arch
Date:   Fri, 19 May 2023 10:46:00 -0600
Message-Id: <20230519164607.38845-1-corbet@lwn.net>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Architecture-specific documentation is being moved into Documentation/arch/
as a way of cleaning up the top-level documentation directory and making
the docs hierarchy more closely match the source hierarchy.  Move
Documentation/arm into arch/ and fix all in-tree references.

This is one of the more intrusive moves (if not *the* most intrusive), but
the changes are all straighforward.

I'm happy to take these through the docs tree, but the potential for
conflicts might be less if they go through an Arm tree instead.

Jonathan Corbet (7):
  arm: docs: Move Arm documentation to Documentation/arch/
  arm: update in-source documentation references
  arm64: Update Documentation/arm references
  mips: update a reference to a moved Arm Document
  crypto: update some Arm documentation references
  docs: update some straggling Documentation/arm references
  dt-bindings: Update Documentation/arm references

 Documentation/{ => arch}/arm/arm.rst                        | 0
 Documentation/{ => arch}/arm/booting.rst                    | 0
 Documentation/{ => arch}/arm/cluster-pm-race-avoidance.rst  | 0
 Documentation/{ => arch}/arm/features.rst                   | 0
 Documentation/{ => arch}/arm/firmware.rst                   | 0
 .../{ => arch}/arm/google/chromebook-boot-flow.rst          | 0
 Documentation/{ => arch}/arm/index.rst                      | 0
 Documentation/{ => arch}/arm/interrupts.rst                 | 0
 Documentation/{ => arch}/arm/ixp4xx.rst                     | 0
 Documentation/{ => arch}/arm/kernel_mode_neon.rst           | 0
 Documentation/{ => arch}/arm/kernel_user_helpers.rst        | 0
 Documentation/{ => arch}/arm/keystone/knav-qmss.rst         | 0
 Documentation/{ => arch}/arm/keystone/overview.rst          | 0
 Documentation/{ => arch}/arm/marvell.rst                    | 0
 Documentation/{ => arch}/arm/mem_alignment.rst              | 0
 Documentation/{ => arch}/arm/memory.rst                     | 0
 Documentation/{ => arch}/arm/microchip.rst                  | 0
 Documentation/{ => arch}/arm/netwinder.rst                  | 0
 Documentation/{ => arch}/arm/nwfpe/index.rst                | 0
 Documentation/{ => arch}/arm/nwfpe/netwinder-fpe.rst        | 0
 Documentation/{ => arch}/arm/nwfpe/notes.rst                | 0
 Documentation/{ => arch}/arm/nwfpe/nwfpe.rst                | 0
 Documentation/{ => arch}/arm/nwfpe/todo.rst                 | 0
 Documentation/{ => arch}/arm/omap/dss.rst                   | 0
 Documentation/{ => arch}/arm/omap/index.rst                 | 0
 Documentation/{ => arch}/arm/omap/omap.rst                  | 0
 Documentation/{ => arch}/arm/omap/omap_pm.rst               | 0
 Documentation/{ => arch}/arm/porting.rst                    | 0
 Documentation/{ => arch}/arm/pxa/mfp.rst                    | 0
 Documentation/{ => arch}/arm/sa1100/assabet.rst             | 0
 Documentation/{ => arch}/arm/sa1100/cerf.rst                | 0
 Documentation/{ => arch}/arm/sa1100/index.rst               | 0
 Documentation/{ => arch}/arm/sa1100/lart.rst                | 0
 Documentation/{ => arch}/arm/sa1100/serial_uart.rst         | 0
 .../{ => arch}/arm/samsung/bootloader-interface.rst         | 0
 .../{ => arch}/arm/samsung/clksrc-change-registers.awk      | 0
 Documentation/{ => arch}/arm/samsung/gpio.rst               | 0
 Documentation/{ => arch}/arm/samsung/index.rst              | 0
 Documentation/{ => arch}/arm/samsung/overview.rst           | 0
 Documentation/{ => arch}/arm/setup.rst                      | 0
 Documentation/{ => arch}/arm/spear/overview.rst             | 0
 Documentation/{ => arch}/arm/sti/overview.rst               | 0
 Documentation/{ => arch}/arm/sti/stih407-overview.rst       | 0
 Documentation/{ => arch}/arm/sti/stih418-overview.rst       | 0
 Documentation/{ => arch}/arm/stm32/overview.rst             | 0
 .../{ => arch}/arm/stm32/stm32-dma-mdma-chaining.rst        | 0
 Documentation/{ => arch}/arm/stm32/stm32f429-overview.rst   | 0
 Documentation/{ => arch}/arm/stm32/stm32f746-overview.rst   | 0
 Documentation/{ => arch}/arm/stm32/stm32f769-overview.rst   | 0
 Documentation/{ => arch}/arm/stm32/stm32h743-overview.rst   | 0
 Documentation/{ => arch}/arm/stm32/stm32h750-overview.rst   | 0
 Documentation/{ => arch}/arm/stm32/stm32mp13-overview.rst   | 0
 Documentation/{ => arch}/arm/stm32/stm32mp151-overview.rst  | 0
 Documentation/{ => arch}/arm/stm32/stm32mp157-overview.rst  | 0
 Documentation/{ => arch}/arm/sunxi.rst                      | 0
 Documentation/{ => arch}/arm/sunxi/clocks.rst               | 0
 Documentation/{ => arch}/arm/swp_emulation.rst              | 0
 Documentation/{ => arch}/arm/tcm.rst                        | 0
 Documentation/{ => arch}/arm/uefi.rst                       | 0
 Documentation/{ => arch}/arm/vfp/release-notes.rst          | 0
 Documentation/{ => arch}/arm/vlocks.rst                     | 0
 Documentation/arch/index.rst                                | 2 +-
 Documentation/devicetree/bindings/arm/xen.txt               | 2 +-
 Documentation/translations/zh_CN/arm/Booting                | 4 ++--
 .../translations/zh_CN/arm/kernel_user_helpers.txt          | 4 ++--
 MAINTAINERS                                                 | 6 +++---
 arch/arm/Kconfig                                            | 2 +-
 arch/arm/common/mcpm_entry.c                                | 2 +-
 arch/arm/common/mcpm_head.S                                 | 2 +-
 arch/arm/common/vlock.S                                     | 2 +-
 arch/arm/include/asm/setup.h                                | 2 +-
 arch/arm/include/uapi/asm/setup.h                           | 2 +-
 arch/arm/kernel/entry-armv.S                                | 2 +-
 arch/arm/mach-exynos/common.h                               | 2 +-
 arch/arm/mach-sti/Kconfig                                   | 2 +-
 arch/arm/mm/Kconfig                                         | 4 ++--
 arch/arm/tools/mach-types                                   | 2 +-
 arch/arm64/Kconfig                                          | 2 +-
 arch/arm64/kernel/kuser32.S                                 | 2 +-
 arch/mips/bmips/setup.c                                     | 5 ++++-
 drivers/crypto/allwinner/sun4i-ss/sun4i-ss-cipher.c         | 2 +-
 drivers/crypto/allwinner/sun4i-ss/sun4i-ss-core.c           | 2 +-
 drivers/crypto/allwinner/sun4i-ss/sun4i-ss-hash.c           | 2 +-
 drivers/crypto/allwinner/sun4i-ss/sun4i-ss.h                | 2 +-
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c         | 2 +-
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c           | 2 +-
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c           | 2 +-
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-prng.c           | 2 +-
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-trng.c           | 2 +-
 drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c         | 2 +-
 drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c           | 2 +-
 drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c           | 2 +-
 drivers/crypto/allwinner/sun8i-ss/sun8i-ss-prng.c           | 2 +-
 drivers/input/touchscreen/sun4i-ts.c                        | 2 +-
 drivers/pwm/pwm-atmel.c                                     | 2 +-
 drivers/pwm/pwm-pxa.c                                       | 2 +-
 drivers/tty/serial/Kconfig                                  | 4 ++--
 97 files changed, 45 insertions(+), 42 deletions(-)
 rename Documentation/{ => arch}/arm/arm.rst (100%)
 rename Documentation/{ => arch}/arm/booting.rst (100%)
 rename Documentation/{ => arch}/arm/cluster-pm-race-avoidance.rst (100%)
 rename Documentation/{ => arch}/arm/features.rst (100%)
 rename Documentation/{ => arch}/arm/firmware.rst (100%)
 rename Documentation/{ => arch}/arm/google/chromebook-boot-flow.rst (100%)
 rename Documentation/{ => arch}/arm/index.rst (100%)
 rename Documentation/{ => arch}/arm/interrupts.rst (100%)
 rename Documentation/{ => arch}/arm/ixp4xx.rst (100%)
 rename Documentation/{ => arch}/arm/kernel_mode_neon.rst (100%)
 rename Documentation/{ => arch}/arm/kernel_user_helpers.rst (100%)
 rename Documentation/{ => arch}/arm/keystone/knav-qmss.rst (100%)
 rename Documentation/{ => arch}/arm/keystone/overview.rst (100%)
 rename Documentation/{ => arch}/arm/marvell.rst (100%)
 rename Documentation/{ => arch}/arm/mem_alignment.rst (100%)
 rename Documentation/{ => arch}/arm/memory.rst (100%)
 rename Documentation/{ => arch}/arm/microchip.rst (100%)
 rename Documentation/{ => arch}/arm/netwinder.rst (100%)
 rename Documentation/{ => arch}/arm/nwfpe/index.rst (100%)
 rename Documentation/{ => arch}/arm/nwfpe/netwinder-fpe.rst (100%)
 rename Documentation/{ => arch}/arm/nwfpe/notes.rst (100%)
 rename Documentation/{ => arch}/arm/nwfpe/nwfpe.rst (100%)
 rename Documentation/{ => arch}/arm/nwfpe/todo.rst (100%)
 rename Documentation/{ => arch}/arm/omap/dss.rst (100%)
 rename Documentation/{ => arch}/arm/omap/index.rst (100%)
 rename Documentation/{ => arch}/arm/omap/omap.rst (100%)
 rename Documentation/{ => arch}/arm/omap/omap_pm.rst (100%)
 rename Documentation/{ => arch}/arm/porting.rst (100%)
 rename Documentation/{ => arch}/arm/pxa/mfp.rst (100%)
 rename Documentation/{ => arch}/arm/sa1100/assabet.rst (100%)
 rename Documentation/{ => arch}/arm/sa1100/cerf.rst (100%)
 rename Documentation/{ => arch}/arm/sa1100/index.rst (100%)
 rename Documentation/{ => arch}/arm/sa1100/lart.rst (100%)
 rename Documentation/{ => arch}/arm/sa1100/serial_uart.rst (100%)
 rename Documentation/{ => arch}/arm/samsung/bootloader-interface.rst (100%)
 rename Documentation/{ => arch}/arm/samsung/clksrc-change-registers.awk (100%)
 rename Documentation/{ => arch}/arm/samsung/gpio.rst (100%)
 rename Documentation/{ => arch}/arm/samsung/index.rst (100%)
 rename Documentation/{ => arch}/arm/samsung/overview.rst (100%)
 rename Documentation/{ => arch}/arm/setup.rst (100%)
 rename Documentation/{ => arch}/arm/spear/overview.rst (100%)
 rename Documentation/{ => arch}/arm/sti/overview.rst (100%)
 rename Documentation/{ => arch}/arm/sti/stih407-overview.rst (100%)
 rename Documentation/{ => arch}/arm/sti/stih418-overview.rst (100%)
 rename Documentation/{ => arch}/arm/stm32/overview.rst (100%)
 rename Documentation/{ => arch}/arm/stm32/stm32-dma-mdma-chaining.rst (100%)
 rename Documentation/{ => arch}/arm/stm32/stm32f429-overview.rst (100%)
 rename Documentation/{ => arch}/arm/stm32/stm32f746-overview.rst (100%)
 rename Documentation/{ => arch}/arm/stm32/stm32f769-overview.rst (100%)
 rename Documentation/{ => arch}/arm/stm32/stm32h743-overview.rst (100%)
 rename Documentation/{ => arch}/arm/stm32/stm32h750-overview.rst (100%)
 rename Documentation/{ => arch}/arm/stm32/stm32mp13-overview.rst (100%)
 rename Documentation/{ => arch}/arm/stm32/stm32mp151-overview.rst (100%)
 rename Documentation/{ => arch}/arm/stm32/stm32mp157-overview.rst (100%)
 rename Documentation/{ => arch}/arm/sunxi.rst (100%)
 rename Documentation/{ => arch}/arm/sunxi/clocks.rst (100%)
 rename Documentation/{ => arch}/arm/swp_emulation.rst (100%)
 rename Documentation/{ => arch}/arm/tcm.rst (100%)
 rename Documentation/{ => arch}/arm/uefi.rst (100%)
 rename Documentation/{ => arch}/arm/vfp/release-notes.rst (100%)
 rename Documentation/{ => arch}/arm/vlocks.rst (100%)

-- 
2.40.1

