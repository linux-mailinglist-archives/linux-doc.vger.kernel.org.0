Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FF6D5A5308
	for <lists+linux-doc@lfdr.de>; Mon, 29 Aug 2022 19:23:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229772AbiH2RXL (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 29 Aug 2022 13:23:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbiH2RXL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 29 Aug 2022 13:23:11 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEC674F6A1
        for <linux-doc@vger.kernel.org>; Mon, 29 Aug 2022 10:23:08 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id bq11so11046945wrb.12
        for <linux-doc@vger.kernel.org>; Mon, 29 Aug 2022 10:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=ROXY/xQox8OqNuTJQ3y6eDkrd5/vObL/9ruPCF9KJhc=;
        b=GPTh7pSppYKbIzxX9/3YX9sE937R2LpYvg8mw/wOK1ZzyqfxtN8ZOAp0PYReeFYHZz
         IIExw5R0osm0CyCIvZaoDG0hqDP2Ctg11vcoV/ZOHWlOp7n27QwClS4v7ydHA3jNKI6n
         /4k7yZZCY8E2uiTpT/9pJD7/ldWmN3PZXUbb4rkCrLNSqB8nTj033+vb5rGU+VjXI4QR
         z+a7hKkLyhdXvIseRHcebsAs4OCFtUDYsGEA330DMt45p6rU1p6IIqMs1V7dv2uG4Rn7
         VtNbNvO3Ixb6KYsjKIgNWq2ZMrKzzg+SvCTToaWL0O+9V5YDUGWWFq0KeuiTJB9nOfFI
         AIDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=ROXY/xQox8OqNuTJQ3y6eDkrd5/vObL/9ruPCF9KJhc=;
        b=o7qbGXKova5VRWrSfpCVCNruu0B3F8A3hRAPe+HqIgaoOmzOWM5isBD7y15YbC2hKb
         WOLHCeZTXRtTt0VPsSgj2WyaEdCQVeVjkkjWQEWpuH/mmaWlztdupEfRkUH8xiQhWUUc
         IyWI6pvF1xEXIui22vem9ClxICFATZtKDkeTt67yoBCLY1bcpa7FaZUJOC5VTwf2Ca2y
         P+Ah9A1gErZbhNH71t7RMc8Y9gza+XiyLw8tceQNFyH6rKiRUJZ6e1ORBl3pmX4kXRz7
         J2G1rKcjKJst6N6An7ND2AMwCdRi7pRF3C/MKZB7DCD3ZjGc2AVA3o9JUpboNe6l/3Ui
         kXCw==
X-Gm-Message-State: ACgBeo2OvY+dZkU5a4IfMGcjADAGC8BuX9F4gdTUQJ1Mk0x8uL8lBl5O
        bFyLiEZ576y24OcGJlM5gAWyIw==
X-Google-Smtp-Source: AA6agR6qERXecGefvattNTWo9v3TTFZE0mKqpbS89ELHPg9qbkLio16lNhQTkR4ObRAON1DzOiWNOg==
X-Received: by 2002:a05:6000:1d82:b0:220:5f9b:9a77 with SMTP id bk2-20020a0560001d8200b002205f9b9a77mr6894102wrb.622.1661793787323;
        Mon, 29 Aug 2022 10:23:07 -0700 (PDT)
Received: from [192.168.2.222] ([51.37.149.245])
        by smtp.gmail.com with ESMTPSA id l9-20020adfe9c9000000b0022586045c89sm7792594wrn.69.2022.08.29.10.23.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Aug 2022 10:23:06 -0700 (PDT)
Message-ID: <3cd38c59-708e-76d3-52dc-2adf250c2d14@conchuod.ie>
Date:   Mon, 29 Aug 2022 18:23:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v5] Remove duplicated words across the whole documentation
Content-Language: en-US
To:     Jules Maselbas <jmaselbas@kalray.eu>, linux-kernel@vger.kernel.org
Cc:     Conor.Dooley@microchip.com, Randy Dunlap <rdunlap@infradead.org>,
        Bagas Sanjaya <bagasdotme@gmail.com>, linux-doc@vger.kernel.org
References: <20220826165634.5617-1-jmaselbas@kalray.eu>
 <20220829092910.12267-1-jmaselbas@kalray.eu>
From:   Conor Dooley <mail@conchuod.ie>
In-Reply-To: <20220829092910.12267-1-jmaselbas@kalray.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 29/08/2022 10:29, Jules Maselbas wrote:
> Remove duplicated words (the, at, be ...) across the whole documentation.
> In some cases the duplicated words are replaced by something that makes
> more sense, for instance: "be be" is replaced by "can be" when possible.
> 
> There are likely more duplicated words.
> 
> CC: Conor.Dooley@microchip.com
> CC: Randy Dunlap <rdunlap@infradead.org>
> CC: Bagas Sanjaya <bagasdotme@gmail.com>
> CC: linux-doc@vger.kernel.org
> Signed-off-by: Jules Maselbas <jmaselbas@kalray.eu>
> ---
> in v5:
>  - remove spurious changes reported by Randy Dunlap
> in v4:
>  - remove spurious changes reported by Conor Dooley
> in v3:
>  as suggested by Randy Dunlap:
>  - remove duplicated 'The the '
>  - remove duplicated 'at at ' (some are replaced by 'at a ')
>  - remove duplicated be, is, to, we, on ...
> in v2:
>  - also remove the second 'the' in one sentence as suggested by
>    Bagas Sanjaya
> ---
>  Documentation/RCU/checklist.rst                               | 2 +-
>  Documentation/admin-guide/kdump/vmcoreinfo.rst                | 2 +-
>  Documentation/bpf/instruction-set.rst                         | 2 +-
>  Documentation/bpf/map_cgroup_storage.rst                      | 4 ++--
>  Documentation/core-api/cpu_hotplug.rst                        | 3 +--

---8<---
>  Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml  | 4 ++--
>  .../devicetree/bindings/arm/tegra/nvidia,tegra20-ahb.txt      | 2 +-
>  Documentation/devicetree/bindings/dma/ti-dma-crossbar.txt     | 2 +-
>  Documentation/devicetree/bindings/fpga/fpga-region.txt        | 4 ++--
>  Documentation/devicetree/bindings/mfd/ti,lp87524-q1.yaml      | 2 +-
>  Documentation/devicetree/bindings/mfd/ti,lp87561-q1.yaml      | 2 +-
>  Documentation/devicetree/bindings/mfd/ti,lp87565-q1.yaml      | 2 +-
>  .../devicetree/bindings/net/amlogic,meson-dwmac.yaml          | 2 +-
>  .../devicetree/bindings/net/can/microchip,mcp251xfd.yaml      | 2 +-
---8<---

I think I saw Jon pointing out against the v3 that these are bindings
and need to be sent separately via the subsystem trees rather than his
docs tree.

Other than that, I read back through these and all seem correct now,
so FWIW:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks.

>  Documentation/driver-api/isa.rst                              | 2 +-
>  Documentation/filesystems/caching/backend-api.rst             | 2 +-
>  Documentation/filesystems/journalling.rst                     | 2 +-
>  Documentation/hwmon/f71882fg.rst                              | 2 +-
>  Documentation/locking/seqlock.rst                             | 2 +-
>  Documentation/sphinx/cdomain.py                               | 2 +-
>  Documentation/trace/histogram.rst                             | 2 +-
>  Documentation/userspace-api/media/dvb/dmx-reqbufs.rst         | 2 +-
>  Documentation/userspace-api/media/dvb/frontend_f_open.rst     | 2 +-
>  23 files changed, 26 insertions(+), 27 deletions(-)
> 
> diff --git a/Documentation/RCU/checklist.rst b/Documentation/RCU/checklist.rst
> index 42cc5d891bd2..7b1c85a16dc3 100644
> --- a/Documentation/RCU/checklist.rst
> +++ b/Documentation/RCU/checklist.rst
> @@ -477,6 +477,6 @@ over a rather long period of time, but improvements are always welcome!
>  	So if you need to wait for both an RCU grace period and for
>  	all pre-existing call_rcu() callbacks, you will need to execute
>  	both rcu_barrier() and synchronize_rcu(), if necessary, using
> -	something like workqueues to to execute them concurrently.
> +	something like workqueues to execute them concurrently.
>  
>  	See rcubarrier.rst for more information.
> diff --git a/Documentation/admin-guide/kdump/vmcoreinfo.rst b/Documentation/admin-guide/kdump/vmcoreinfo.rst
> index 8419019b6a88..6726f439958c 100644
> --- a/Documentation/admin-guide/kdump/vmcoreinfo.rst
> +++ b/Documentation/admin-guide/kdump/vmcoreinfo.rst
> @@ -200,7 +200,7 @@ prb
>  
>  A pointer to the printk ringbuffer (struct printk_ringbuffer). This
>  may be pointing to the static boot ringbuffer or the dynamically
> -allocated ringbuffer, depending on when the the core dump occurred.
> +allocated ringbuffer, depending on when the core dump occurred.
>  Used by user-space tools to read the active kernel log buffer.
>  
>  printk_rb_static
> diff --git a/Documentation/bpf/instruction-set.rst b/Documentation/bpf/instruction-set.rst
> index 1b0e6711dec9..0ac7ae40be37 100644
> --- a/Documentation/bpf/instruction-set.rst
> +++ b/Documentation/bpf/instruction-set.rst
> @@ -133,7 +133,7 @@ code field of ``BPF_END``.
>  The byte swap instructions operate on the destination register
>  only and do not use a separate source register or immediate value.
>  
> -The 1-bit source operand field in the opcode is used to to select what byte
> +The 1-bit source operand field in the opcode is used to select what byte
>  order the operation convert from or to:
>  
>    =========  =====  =================================================
> diff --git a/Documentation/bpf/map_cgroup_storage.rst b/Documentation/bpf/map_cgroup_storage.rst
> index cab9543017bf..8e5fe532c07e 100644
> --- a/Documentation/bpf/map_cgroup_storage.rst
> +++ b/Documentation/bpf/map_cgroup_storage.rst
> @@ -31,7 +31,7 @@ The map uses key of type of either ``__u64 cgroup_inode_id`` or
>      };
>  
>  ``cgroup_inode_id`` is the inode id of the cgroup directory.
> -``attach_type`` is the the program's attach type.
> +``attach_type`` is the program's attach type.
>  
>  Linux 5.9 added support for type ``__u64 cgroup_inode_id`` as the key type.
>  When this key type is used, then all attach types of the particular cgroup and
> @@ -155,7 +155,7 @@ However, the BPF program can still only associate with one map of each type
>  ``BPF_MAP_TYPE_CGROUP_STORAGE`` or more than one
>  ``BPF_MAP_TYPE_PERCPU_CGROUP_STORAGE``.
>  
> -In all versions, userspace may use the the attach parameters of cgroup and
> +In all versions, userspace may use the attach parameters of cgroup and
>  attach type pair in ``struct bpf_cgroup_storage_key`` as the key to the BPF map
>  APIs to read or update the storage for a given attachment. For Linux 5.9
>  attach type shared storages, only the first value in the struct, cgroup inode
> diff --git a/Documentation/core-api/cpu_hotplug.rst b/Documentation/core-api/cpu_hotplug.rst
> index c6f4ba2fb32d..c326f4a86d34 100644
> --- a/Documentation/core-api/cpu_hotplug.rst
> +++ b/Documentation/core-api/cpu_hotplug.rst
> @@ -560,8 +560,7 @@ available:
>    * cpuhp_state_remove_instance(state, node)
>    * cpuhp_state_remove_instance_nocalls(state, node)
>  
> -The arguments are the same as for the the cpuhp_state_add_instance*()
> -variants above.
> +The arguments are the same as for cpuhp_state_add_instance*() variants above.
>  
>  The functions differ in the way how the installed callbacks are treated:
>  
> diff --git a/Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml b/Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml
> index a4b4452afc1d..e5b56ee500bc 100644
> --- a/Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml
> +++ b/Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml
> @@ -121,7 +121,7 @@ properties:
>  
>    arm,vexpress,position:
>      description: When daughterboards are stacked on one site, their position
> -      in the stack be be described this attribute.
> +      in the stack can be described with this attribute.
>      $ref: '/schemas/types.yaml#/definitions/uint32'
>      minimum: 0
>      maximum: 3
> @@ -139,7 +139,7 @@ patternProperties:
>        the connection between the motherboard and any tiles. Sometimes the
>        compatible is placed directly under this node, sometimes it is placed
>        in a subnode named "motherboard-bus". Sometimes the compatible includes
> -      "arm,vexpress,v2?-p1" sometimes (on software models) is is just
> +      "arm,vexpress,v2?-p1" sometimes (on software models) it is just
>        "simple-bus". If the compatible is placed in the "motherboard-bus" node,
>        it is stricter and always has two compatibles.
>      type: object
> diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-ahb.txt b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-ahb.txt
> index 9a4295b54539..b300c42c52d7 100644
> --- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-ahb.txt
> +++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-ahb.txt
> @@ -8,7 +8,7 @@ Required properties:
>  - reg : Should contain 1 register ranges(address and length).  For
>    Tegra20, Tegra30, and Tegra114 chips, the value must be <0x6000c004
>    0x10c>.  For Tegra124, Tegra132 and Tegra210 chips, the value should
> -  be be <0x6000c000 0x150>.
> +  be <0x6000c000 0x150>.
>  
>  Example (for a Tegra20 chip):
>  	ahb: ahb@6000c004 {
> diff --git a/Documentation/devicetree/bindings/dma/ti-dma-crossbar.txt b/Documentation/devicetree/bindings/dma/ti-dma-crossbar.txt
> index b849a1ed389d..47e477cce6d2 100644
> --- a/Documentation/devicetree/bindings/dma/ti-dma-crossbar.txt
> +++ b/Documentation/devicetree/bindings/dma/ti-dma-crossbar.txt
> @@ -4,7 +4,7 @@ Required properties:
>  - compatible:	"ti,dra7-dma-crossbar" for DRA7xx DMA crossbar
>  		"ti,am335x-edma-crossbar" for AM335x and AM437x
>  - reg:		Memory map for accessing module
> -- #dma-cells:	Should be set to to match with the DMA controller's dma-cells
> +- #dma-cells:	Should be set to match with the DMA controller's dma-cells
>  		for ti,dra7-dma-crossbar and <3> for ti,am335x-edma-crossbar.
>  - dma-requests:	Number of DMA requests the crossbar can receive
>  - dma-masters:	phandle pointing to the DMA controller
> diff --git a/Documentation/devicetree/bindings/fpga/fpga-region.txt b/Documentation/devicetree/bindings/fpga/fpga-region.txt
> index 6694ef29a267..095b5e728dff 100644
> --- a/Documentation/devicetree/bindings/fpga/fpga-region.txt
> +++ b/Documentation/devicetree/bindings/fpga/fpga-region.txt
> @@ -50,7 +50,7 @@ Partial Reconfiguration Region (PRR)
>  Persona
>   * Also called a "partial bit stream"
>   * An FPGA image that is designed to be loaded into a PRR.  There may be
> -   any number of personas designed to fit into a PRR, but only one at at time
> +   any number of personas designed to fit into a PRR, but only one at a time
>     may be loaded.
>   * A persona may create more regions.
>  
> @@ -127,7 +127,7 @@ add the child devices:
>  
>   * FPGA Manager
>   * FPGA Bridges
> - * image-specific information needed to to the programming.
> + * image-specific information needed to do the programming.
>   * child nodes
>  
>  The intended use is that a Device Tree overlay (DTO) can be used to reprogram an
> diff --git a/Documentation/devicetree/bindings/mfd/ti,lp87524-q1.yaml b/Documentation/devicetree/bindings/mfd/ti,lp87524-q1.yaml
> index f6cac4b1079c..3549a32452ec 100644
> --- a/Documentation/devicetree/bindings/mfd/ti,lp87524-q1.yaml
> +++ b/Documentation/devicetree/bindings/mfd/ti,lp87524-q1.yaml
> @@ -26,7 +26,7 @@ properties:
>    '#gpio-cells':
>      description:
>        The first cell is the pin number.
> -      The second cell is is used to specify flags.
> +      The second cell is used to specify flags.
>        See ../gpio/gpio.txt for more information.
>      const: 2
>  
> diff --git a/Documentation/devicetree/bindings/mfd/ti,lp87561-q1.yaml b/Documentation/devicetree/bindings/mfd/ti,lp87561-q1.yaml
> index dc5a29b5ef7d..43a3f7ccaf36 100644
> --- a/Documentation/devicetree/bindings/mfd/ti,lp87561-q1.yaml
> +++ b/Documentation/devicetree/bindings/mfd/ti,lp87561-q1.yaml
> @@ -26,7 +26,7 @@ properties:
>    '#gpio-cells':
>      description:
>        The first cell is the pin number.
> -      The second cell is is used to specify flags.
> +      The second cell is used to specify flags.
>        See ../gpio/gpio.txt for more information.
>      const: 2
>  
> diff --git a/Documentation/devicetree/bindings/mfd/ti,lp87565-q1.yaml b/Documentation/devicetree/bindings/mfd/ti,lp87565-q1.yaml
> index 012d25111054..373c4f89c4ea 100644
> --- a/Documentation/devicetree/bindings/mfd/ti,lp87565-q1.yaml
> +++ b/Documentation/devicetree/bindings/mfd/ti,lp87565-q1.yaml
> @@ -28,7 +28,7 @@ properties:
>    '#gpio-cells':
>      description:
>        The first cell is the pin number.
> -      The second cell is is used to specify flags.
> +      The second cell is used to specify flags.
>        See ../gpio/gpio.txt for more information.
>      const: 2
>  
> diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> index 608e1d62bed5..3eb0513d824c 100644
> --- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> @@ -149,7 +149,7 @@ properties:
>        - description:
>            The first register range should be the one of the DWMAC controller
>        - description:
> -          The second range is is for the Amlogic specific configuration
> +          The second range is for the Amlogic specific configuration
>            (for example the PRG_ETHERNET register range on Meson8b and newer)
>  
>  required:
> diff --git a/Documentation/devicetree/bindings/net/can/microchip,mcp251xfd.yaml b/Documentation/devicetree/bindings/net/can/microchip,mcp251xfd.yaml
> index 7a73057707b4..0415c3a886ca 100644
> --- a/Documentation/devicetree/bindings/net/can/microchip,mcp251xfd.yaml
> +++ b/Documentation/devicetree/bindings/net/can/microchip,mcp251xfd.yaml
> @@ -42,7 +42,7 @@ properties:
>  
>    microchip,rx-int-gpios:
>      description:
> -      GPIO phandle of GPIO connected to to INT1 pin of the MCP251XFD, which
> +      GPIO phandle of GPIO connected to INT1 pin of the MCP251XFD, which
>        signals a pending RX interrupt.
>      maxItems: 1
>  
> diff --git a/Documentation/driver-api/isa.rst b/Documentation/driver-api/isa.rst
> index def4a7b690b5..3df1b1696524 100644
> --- a/Documentation/driver-api/isa.rst
> +++ b/Documentation/driver-api/isa.rst
> @@ -100,7 +100,7 @@ I believe platform_data is available for this, but if rather not, moving
>  the isa_driver pointer to the private struct isa_dev is ofcourse fine as
>  well.
>  
> -Then, if the the driver did not provide a .match, it matches. If it did,
> +Then, if the driver did not provide a .match, it matches. If it did,
>  the driver match() method is called to determine a match.
>  
>  If it did **not** match, dev->platform_data is reset to indicate this to
> diff --git a/Documentation/filesystems/caching/backend-api.rst b/Documentation/filesystems/caching/backend-api.rst
> index d7507becf674..3a199fc50828 100644
> --- a/Documentation/filesystems/caching/backend-api.rst
> +++ b/Documentation/filesystems/caching/backend-api.rst
> @@ -122,7 +122,7 @@ volumes, calling::
>  to tell fscache that a volume has been withdrawn.  This waits for all
>  outstanding accesses on the volume to complete before returning.
>  
> -When the the cache is completely withdrawn, fscache should be notified by
> +When the cache is completely withdrawn, fscache should be notified by
>  calling::
>  
>  	void fscache_relinquish_cache(struct fscache_cache *cache);
> diff --git a/Documentation/filesystems/journalling.rst b/Documentation/filesystems/journalling.rst
> index e18f90ffc6fd..2a69bd2d95ed 100644
> --- a/Documentation/filesystems/journalling.rst
> +++ b/Documentation/filesystems/journalling.rst
> @@ -93,7 +93,7 @@ easily as on jbd2_journal_start().
>  
>  Try to reserve the right number of blocks the first time. ;-). This will
>  be the maximum number of blocks you are going to touch in this
> -transaction. I advise having a look at at least ext4_jbd.h to see the
> +transaction. I advise having at least a look at ext4_jbd.h to see the
>  basis on which ext4 uses to make these decisions.
>  
>  Another wriggle to watch out for is your on-disk block allocation
> diff --git a/Documentation/hwmon/f71882fg.rst b/Documentation/hwmon/f71882fg.rst
> index 38e30fbd4806..ab83bc7bbbdf 100644
> --- a/Documentation/hwmon/f71882fg.rst
> +++ b/Documentation/hwmon/f71882fg.rst
> @@ -179,7 +179,7 @@ Writing an unsupported mode will result in an invalid parameter error.
>  
>  * 2: Normal auto mode
>    You can define a number of temperature/fan speed trip points, which % the
> -  fan should run at at this temp and which temp a fan should follow using the
> +  fan should run at this temp and which temp a fan should follow using the
>    standard sysfs interface. The number and type of trip points is chip
>    depended, see which files are available in sysfs.
>    Fan/PWM channel 3 of the F8000 is always in this mode!
> diff --git a/Documentation/locking/seqlock.rst b/Documentation/locking/seqlock.rst
> index 64405e5da63e..bfda1a5fecad 100644
> --- a/Documentation/locking/seqlock.rst
> +++ b/Documentation/locking/seqlock.rst
> @@ -39,7 +39,7 @@ as the writer can invalidate a pointer that the reader is following.
>  Sequence counters (``seqcount_t``)
>  ==================================
>  
> -This is the the raw counting mechanism, which does not protect against
> +This is the raw counting mechanism, which does not protect against
>  multiple writers.  Write side critical sections must thus be serialized
>  by an external lock.
>  
> diff --git a/Documentation/sphinx/cdomain.py b/Documentation/sphinx/cdomain.py
> index ca8ac9e59ded..a7d1866e72ff 100644
> --- a/Documentation/sphinx/cdomain.py
> +++ b/Documentation/sphinx/cdomain.py
> @@ -151,7 +151,7 @@ class CObject(Base_CObject):
>      def handle_func_like_macro(self, sig, signode):
>          u"""Handles signatures of function-like macros.
>  
> -        If the objtype is 'function' and the the signature ``sig`` is a
> +        If the objtype is 'function' and the signature ``sig`` is a
>          function-like macro, the name of the macro is returned. Otherwise
>          ``False`` is returned.  """
>  
> diff --git a/Documentation/trace/histogram.rst b/Documentation/trace/histogram.rst
> index 859fd1b76c63..c1b685a38f6b 100644
> --- a/Documentation/trace/histogram.rst
> +++ b/Documentation/trace/histogram.rst
> @@ -412,7 +412,7 @@ Extended error information
>    Because the default sort key above is 'hitcount', the above shows a
>    the list of call_sites by increasing hitcount, so that at the bottom
>    we see the functions that made the most kmalloc calls during the
> -  run.  If instead we we wanted to see the top kmalloc callers in
> +  run.  If instead we wanted to see the top kmalloc callers in
>    terms of the number of bytes requested rather than the number of
>    calls, and we wanted the top caller to appear at the top, we can use
>    the 'sort' parameter, along with the 'descending' modifier::
> diff --git a/Documentation/userspace-api/media/dvb/dmx-reqbufs.rst b/Documentation/userspace-api/media/dvb/dmx-reqbufs.rst
> index d2bb1909ec98..18810f0bbca8 100644
> --- a/Documentation/userspace-api/media/dvb/dmx-reqbufs.rst
> +++ b/Documentation/userspace-api/media/dvb/dmx-reqbufs.rst
> @@ -72,4 +72,4 @@ appropriately. The generic error codes are described at the
>  :ref:`Generic Error Codes <gen-errors>` chapter.
>  
>  EOPNOTSUPP
> -    The  the requested I/O method is not supported.
> +    The requested I/O method is not supported.
> diff --git a/Documentation/userspace-api/media/dvb/frontend_f_open.rst b/Documentation/userspace-api/media/dvb/frontend_f_open.rst
> index bb37eded0870..70e169b8f601 100644
> --- a/Documentation/userspace-api/media/dvb/frontend_f_open.rst
> +++ b/Documentation/userspace-api/media/dvb/frontend_f_open.rst
> @@ -91,7 +91,7 @@ appropriately.
>         -  The caller has no permission to access the device.
>  
>      -  - ``EBUSY``
> -       -  The the device driver is already in use.
> +       -  The device driver is already in use.
>  
>      -  - ``EMFILE``
>         -  The process already has the maximum number of files open.
