Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 277E2FFC3A
	for <lists+linux-doc@lfdr.de>; Mon, 18 Nov 2019 00:27:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726483AbfKQX1I (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 17 Nov 2019 18:27:08 -0500
Received: from mail-io1-f68.google.com ([209.85.166.68]:38224 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726463AbfKQX1I (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 17 Nov 2019 18:27:08 -0500
Received: by mail-io1-f68.google.com with SMTP id i13so16662993ioj.5
        for <linux-doc@vger.kernel.org>; Sun, 17 Nov 2019 15:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=J89g5wKF3K8lf+tI2gl2oVD6gxnq4u3cgSB1j+ImJmM=;
        b=DJS6juIxp3hTnbk6xQChYKZPQHDN7YextHFPQEOT4BNIaE6YqT+t5udEtEH8U1sqmn
         wEabjzybZ6ciPytTIEn6bF2cMI+d7AYKpSuN9lLd4U51F82tEdHiOLv91ydaiup4i5jE
         Kzgih/urs8/UmucfgEiaLJugGsmUR1229/jSq9DSK7mfF/IxZrNFQu+MljzEb2forngU
         TNgIUrictIscFY++2F2EqZfRyxiqINy0qvrVLO/zPK+cFLT7wiI0ng7yLRmrBxhg7hws
         GjU0WLSxtldgoNJvHB9Z3tJS8ACDmdPvCE0t8GbUN5wf2S7lox+qnu4t24DSr6ZfNU2S
         dfQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J89g5wKF3K8lf+tI2gl2oVD6gxnq4u3cgSB1j+ImJmM=;
        b=UefITgJ7776PA5CpCVRxhyu65xiqo5iLjsH8/XkyNhq/yp1LOHEYAMek9IGyx/KUPj
         9d4kzfve74STG+SJh64X3f/xTtrNvPzSZecx4dTnIWAKMXRZ/ovalY96arF0a0/vdPnH
         /nfTmJrJIxH4FIxoVr4YABNPnzljBhzTH1MssBKtfKkOkl62D3xLConsSKgGBPL1krwL
         oH4y45kxsYaLIh8xnQ8be3/Dy9/q3VGXjtKzjZrSQnGtfIGNhmdOoUlQQQecT6pRt9fy
         L0wPUnyJtds6GgZK1jEt/pnd/AB8GNx6cCayecNzoT2LEWkIwi4Ocutx+b3JNrvBwlZx
         nO6g==
X-Gm-Message-State: APjAAAXArYw55D3cJ0ZXxeiDltWss1XOJD8ZfmzC40lORPTsdLM69IQ6
        t7bR5nbahonIRF9iQAi33wVsaxWHV8D21vKi8zmy5g==
X-Google-Smtp-Source: APXvYqxwxswmpJRFAdlcuG1ze2koW77BmPysoiXIYeuwmZe3PAz+clYihPYGjvuapIDcH1a5i1AW2ww2n1yXkKVeax0=
X-Received: by 2002:a5e:db07:: with SMTP id q7mr327515iop.49.1574033227251;
 Sun, 17 Nov 2019 15:27:07 -0800 (PST)
MIME-Version: 1.0
References: <20190926112933.8922-1-kishon@ti.com> <20190926112933.8922-5-kishon@ti.com>
In-Reply-To: <20190926112933.8922-5-kishon@ti.com>
From:   Jon Mason <jdmason@kudzu.us>
Date:   Sun, 17 Nov 2019 18:26:56 -0500
Message-ID: <CAPoiz9zWO14Gu=ZK4mWGX-7UHhzH+1_SJkSoW3hM6x63cmLSNQ@mail.gmail.com>
Subject: Re: [RFC PATCH 04/21] Documentation: PCI: Add specification for the
 *PCI NTB* function device
To:     Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Bjorn Helgaas <bhelgaas@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>,
        Dave Jiang <dave.jiang@intel.com>,
        Allen Hubbe <allenbh@gmail.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Mark Rutland <mark.rutland@arm.com>, linux-pci@vger.kernel.org,
        linux-doc@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-ntb <linux-ntb@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Sep 26, 2019 at 7:30 AM 'Kishon Vijay Abraham I' via linux-ntb
<linux-ntb@googlegroups.com> wrote:
>
> Add specification for the *PCI NTB* function device. The endpoint function
> driver and the host PCI driver should be created based on this
> specification.
>
> Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
> ---
>  Documentation/PCI/endpoint/pci-test-ntb.txt | 315 ++++++++++++++++++++
>  1 file changed, 315 insertions(+)
>  create mode 100644 Documentation/PCI/endpoint/pci-test-ntb.txt
>
> diff --git a/Documentation/PCI/endpoint/pci-test-ntb.txt b/Documentation/PCI/endpoint/pci-test-ntb.txt
> new file mode 100644
> index 000000000000..c8bfe9dbfd8b
> --- /dev/null
> +++ b/Documentation/PCI/endpoint/pci-test-ntb.txt
> @@ -0,0 +1,315 @@
> +                              PCI NTB FUNCTION
> +                   Kishon Vijay Abraham I <kishon@ti.com>
> +
> +PCI NTB Function allows two different systems (or hosts) to communicate
> +with each other by configurig the endpoint instances in such a way that
> +transactions from one system is routed to the other system.
> +
> +In the below diagram, PCI NTB function configures the SoC with multiple
> +PCIe Endpoint (EP) instances in such a way that transaction from one EP
> +controller is routed to the other EP controller. Once PCI NTB function
> +configures the SoC with multiple EP instances, HOST1 and HOST2 can
> +communicate with each other using SoC as a bridge.
> +
> +   +-------------+                                   +-------------+
> +   |             |                                   |             |
> +   |    HOST1    |                                   |    HOST2    |
> +   |             |                                   |             |
> +   +------^------+                                   +------^------+
> +          |                                                 |
> +          |                                                 |
> ++---------|-------------------------------------------------|---------+
> +|  +------v------+                                   +------v------+  |
> +|  |             |                                   |             |  |
> +|  |     EP      |                                   |     EP      |  |
> +|  | CONTROLLER1 |                                   | CONTROLLER2 |  |
> +|  |             <----------------------------------->             |  |
> +|  |             |                                   |             |  |
> +|  |             |                                   |             |  |
> +|  |             |  SoC With Multiple EP Instances   |             |  |
> +|  |             |  (Configured using NTB Function)  |             |  |
> +|  +-------------+                                   +-------------+  |
> ++---------------------------------------------------------------------+
> +
> +Constructs used for Implementing NTB:
> +
> +       *) Config Region
> +       *) Self Scratchpad Registers
> +       *) Peer Scratchpad Registers
> +       *) Doorbell Registers
> +       *) Memory Window
> +
> +Modeling Constructs:
> +
> +  There are 5 or more distinct regions (config, self scratchpad, peer
> +scratchpad, doorbell, one or more memory windows) to be modeled to achieve
> +NTB functionality. Atleast one memory window is required while more than
> +one is permitted. All these regions should be mapped to BAR for hosts to
> +access these regions.
> +
> +If one 32-bit BAR is allocated for each of these regions, the scheme would
> +look like
> +       BAR0 -> Config Region
> +       BAR1 -> Self Scratchpad
> +       BAR2 -> Peer Scratchpad
> +       BAR3 -> Doorbell
> +       BAR4 -> Memory Window 1
> +       BAR5 -> Memory Window 2
> +
> +However if we allocate a separate BAR for each of the region, there would not
> +be enough BARs for all the regions in a platform that supports only 64-bit
> +BAR.
> +
> +In order to be be supported by most of the platforms, the regions should be
> +packed and mapped to BARs in a way that provides NTB functionality and
> +also making sure the hosts doesn't access any region that it is not supposed
> +to.
> +
> +The following scheme is used in EPF NTB Function
> +
> +       BAR0 -> Config Region + Self Scratchpad
> +       BAR1 -> Peer Scratchpad
> +       BAR2 -> Doorbell + Memory Window 1
> +       BAR3 -> Memory Window 2
> +       BAR4 -> Memory Window 3
> +       BAR4 -> Memory Window 4
> +
> +With this scheme, for the basic NTB functionality 3 BARs should be sufficient.
> +
> +Modeling Config/Scratchpad Region:
> +
> ++-----------------+------->+------------------+        +-----------------+
> +|       BAR0      |        |  CONFIG REGION   |        |       BAR0      |
> ++-----------------+----+   +------------------+<-------+-----------------+
> +|       BAR1      |    |   |SCRATCHPAD REGION |        |       BAR1      |
> ++-----------------+    +-->+------------------+<-------+-----------------+
> +|       BAR2      |            Local Memory            |       BAR2      |
> ++-----------------+                                    +-----------------+
> +|       BAR3      |                                    |       BAR3      |
> ++-----------------+                                    +-----------------+
> +|       BAR4      |                                    |       BAR4      |
> ++-----------------+                                    +-----------------+
> +|       BAR5      |                                    |       BAR5      |
> ++-----------------+                                    +-----------------+
> +  EP CONTROLLER 1                                        EP CONTROLLER 2
> +
> +Above diagram shows Config region + Scratchpad region for HOST1 (connected to
> +EP controller 1) allocated in local memory. The HOST1 can access the config
> +region and scratchpad region (self scratchpad) using BAR0 of EP controller 1.
> +The peer host (HOST2 connected to EP controller 2) can also access this
> +scratchpad region (peer scratchpad) using BAR1 of EP controller 2. This
> +diagram shows the case where Config region and Scratchpad region is allocated
> +for HOST1, however the same is applicable for HOST2.
> +
> +Modeling Doorbell/Memory Window 1:
> +
> ++-----------------+    +----->+----------------+-----------+-----------------+
> +|       BAR0      |    |      |   Doorbell 1   +-----------> MSI|X ADDRESS 1 |
> ++-----------------+    |      +----------------+           +-----------------+
> +|       BAR1      |    |      |   Doorbell 2   +---------+ |                 |
> ++-----------------+    |      +----------------+         | |                 |
> +|       BAR2      |    |      |   Doorbell 3   +-------+ | +-----------------+
> ++-----------------+    |      +----------------+       | +-> MSI|X ADDRESS 2 |
> +|       BAR3      |    |      |   Doorbell 4   +-----+ |   +-----------------+
> ++----------------------+      +----------------+     | |   |                 |
> +|       BAR4      |           |                |     | |   +-----------------+
> ++----------------------+      |      MW1       +---+ | +-->+ MSI|X ADDRESS 3||
> +|       BAR5      |    |      |                |   | |     +-----------------+
> ++-----------------+    +----->-----------------+   | |     |                 |
> +  EP CONTROLLER 1             |                |   | |     +-----------------+
> +                              |                |   | +---->+ MSI|X ADDRESS 4 |
> +                              +----------------+   |       +-----------------+
> +                               EP CONTROLLER 2     |       |                 |
> +                                 (OB SPACE)        |       |                 |
> +                                                   +------->      MW1        |
> +                                                           |                 |
> +                                                           |                 |
> +                                                           +-----------------+
> +                                                           |                 |
> +                                                           |                 |
> +                                                           |                 |
> +                                                           |                 |
> +                                                           |                 |
> +                                                           +-----------------+
> +                                                           PCI Address Space
> +                                                           (Managed by HOST2)
> +
> +Above diagram shows how the doorbell and memory window 1 is mapped so that
> +HOST1 can raise doorbell interrupt on HOST2 and also how HOST1 can access
> +buffers exposed by HOST2 using memory window1 (MW1). Here doorbell and
> +memory window 1 regions are allocated in EP controller 2 outbound (OB) address
> +space. Allocating and configuring BARs for doorbell and memory window1
> +is done during the initialization phase of NTB endpoint function driver.
> +Mapping from EP controller 2 OB space to PCI address space is done when HOST2
> +sends CMD_CONFIGURE_MW/CMD_CONFIGURE_DOORBELL. The commands are explained
> +below.
> +
> +Modeling Optional Memory Windows:
> +
> +This is modeled the same was as MW1 but each of the additional memory windows
> +is mapped to separate BARs.
> +
> +Config Region:
> +
> +Config Region is a construct that is specific to NTB implemented using NTB
> +Endpoint Function Driver. The host and endpoint side NTB function driver will
> +exchange informatio with each other using this region. Config Region has

s/informatio/information

> +Control/Status Registers for configuring the Endpoint Controller. Host can
> +write into this region for configuring the outbound ATU and to indicate the
> +link status. Endpoint can indicate the status of commands issued be host in
> +this region. Endpoint can also indicate the scratchpad offset, number of
> +memory windows to the host using this region.
> +
> +The format of Config Region is given below. Each of the fields here are 32
> +bits.
> +
> +       +------------------------+
> +       |         COMMAND        |
> +       +------------------------+
> +       |         ARGUMENT       |
> +       +------------------------+
> +       |         STATUS         |
> +       +------------------------+
> +       |         TOPOLOGY       |
> +       +------------------------+
> +       |    ADDRESS (LOWER 32)  |
> +       +------------------------+
> +       |    ADDRESS (UPPER 32)  |
> +       +------------------------+
> +       |           SIZE         |
> +       +------------------------+
> +       |  MEMORY WINDOW1 OFFSET |
> +       +------------------------+
> +       |   NO OF MEMORY WINDOW  |
> +       +------------------------+
> +       |       SPAD OFFSET      |
> +       +------------------------+
> +       |        SPAD COUNT      |
> +       +------------------------+
> +       |      DB ENTRY SIZE     |
> +       +------------------------+
> +       |         DB DATA        |
> +       +------------------------+
> +       |            :           |
> +       +------------------------+
> +       |            :           |
> +       +------------------------+
> +       |         DB DATA        |
> +       +------------------------+

The number should probably come before the MW1 offset.  Also, this
assumes that they are all contiguous and of the same size.  Optimally,
there should be a tuple for each MW with the start and size, and you
could parse this with the num of mw you mention above to find out
where the SPAD information starts.  Worst case, I think you might be
able to get away with them all being the same size, but you'll need to
say what size that is in another field.

Thanks,
Jon

> +
> +
> +  COMMAND:
> +
> +       NTB function supports three commands:
> +
> +         CMD_CONFIGURE_DOORBELL (0x1): Command to configure doorbell. Before
> +       invoking this command, the host should allocate and initialize
> +       MSI/MSI-X vectors (i.e initialize the MSI/MSI-X capability in the
> +       Endpoint). The endpoint on receiving this command will configure
> +       the outbound ATU such that transaction to DB BAR will be routed
> +       to the MSI/MSI-X address programmed by the host. The ARGUMENT
> +       register should be populated with number of DBs to configure (in the
> +       lower 16 bits) and if MSI or MSI-X should be configured (BIT 16).
> +       (TODO: Add support for MSI-X).
> +
> +         CMD_CONFIGURE_MW (0x2): Command to configure memory window. The
> +       host invokes this command after allocating a buffer that can be
> +       accessed by remote host. The allocated address should be programmed
> +       in the ADDRESS register (64 bit), the size should be programmed in
> +       the SIZE register and the memory window index should be programmed
> +       in the ARGUMENT register. The endpoint on receiving this command
> +       will configure the outbound ATU such that trasaction to MW BAR
> +       will be routed to the address provided by the host.
> +
> +         CMD_LINK_UP (0x3): Command to indicate an NTB application is
> +       bound to the EP device on the host side. Once the endpoint
> +       receives this command from both the hosts, the endpoint will
> +       raise an LINK_UP event to both the hosts to indicate the hosts
> +       can start communicating with each other.
> +
> +  ARGUMENT:
> +
> +       The value of this register is based on the commands issued in
> +       command register. See COMMAND section for more information.
> +
> +  configuring memory window and to indicate the host side NTB application
> +  has initialized.
> +
> +  TOPOLOGY:
> +
> +       Set to NTB_TOPO_B2B_USD for Primary interface
> +       Set to NTB_TOPO_B2B_DSD for Secondary interface
> +
> +  ADDRESS/SIZE:
> +
> +       Address and Size to be used while configuring the memory window.
> +       See "CMD_CONFIGURE_MW" for more info.
> +
> +  MEMORY WINDOW1 OFFSET:
> +
> +       Memory Window 1 and Doorbell registers are packed together in the
> +       same BAR. The initial portion of the region will have doorbell
> +       registers and the latter portion of the region is for memory window 1.
> +       This register will specify the offset of the memory window 1.
> +
> +  NO OF MEMORY WINDOW:
> +
> +       Specifies the number of memory windows supported by the NTB device.
> +
> +  SPAD OFFSET:
> +
> +       Self scratchpad region and config region are packed together in the
> +       same BAR. The initial portion of the will have config region and
> +       the latter portion of the region is for self scratchpad. This
> +       register will specify the offset of the self scratchpad registers.
> +
> +  SPAD COUNT:
> +
> +       Specifies the number of scratchpad registers supported by the NTB
> +       device.
> +
> +  DB ENTRY SIZE:
> +
> +       Used to determine the offset within the DB BAR that should be written
> +       in order to raise doorbell. EPF NTB can use either MSI/MSI-X to
> +       ring doorbell (MSI-X support will be added later). MSI uses same
> +       address for all the interrupts and MSI-X can provide different
> +       addresses for different interrupts. The MSI/MSI-X address is provided
> +       by the host and the address it gives is based on the MSI/MSI-X
> +       implementation supported by the host. For instance, ARM platform
> +       using GIC ITS will have same MSI-X address for all the interrupts.
> +       In order to support all the combinations and use the same mechanism
> +       for both MSI and MSI-X, EPF NTB allocates separate region in the
> +       Outbound Address Space for each of the interrupts. This region will
> +       be mapped to the MSI/MSI-X address provided by the host. If a host
> +       provides the same address for all the interrupts, all the regions
> +       will be translated to the same address. If a host provides different
> +       address, the regions will be translated to different address. This
> +       will ensure there is no difference while raising the doorbell.
> +
> +  DB DATA:
> +
> +       EPF NTB supports 32 interrupts. So there are 32 DB DATA registers.
> +       This holds the MSI/MSI-X data that has to be written to MSI address
> +       for raising doorbell interrupt. This will be populated by EPF NTB
> +       while invoking CMD_CONFIGURE_MW.
> +
> +Scratchpad Registers:
> +
> +  Each host has it's own register space allocated in the memory of NTB EPC.
> +  They are both readable and writable from both sides of the bridge. They
> +  are used by applications built over NTB and can be used to pass control
> +  and status information between both sides of a device.
> +
> +  Scratchpad registers has 2 parts
> +       1) Self Scratchpad: Host's own register space
> +       2) Peer Scratchpad: Remote host's register space.
> +
> +Doorbell Registers:
> +
> +  Registers using which one host can interrupt the other host.
> +
> +Memory Window:
> +
> +  Actual transfer of data between the two hosts will happen using the
> +  memory window.
> --
> 2.17.1
>
> --
> You received this message because you are subscribed to the Google Groups "linux-ntb" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to linux-ntb+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/linux-ntb/20190926112933.8922-5-kishon%40ti.com.
