Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A11C6ED862
	for <lists+linux-doc@lfdr.de>; Tue, 25 Apr 2023 01:16:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232845AbjDXXQt (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 24 Apr 2023 19:16:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229755AbjDXXQp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 24 Apr 2023 19:16:45 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E00793E8;
        Mon, 24 Apr 2023 16:16:43 -0700 (PDT)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33OMqccU027417;
        Mon, 24 Apr 2023 23:16:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=C6x+ezs5oIrgdvXKUCXjeMXzDUB4EKTwEYqtVCN2ZSM=;
 b=FrQtgEVI3r4C/95kV5BmkZ6J1wgol69SSsu7MUm2Cu+wf6FTUXTxXQvwZWeIHGK0fgEm
 dIwldo6L9ERqic4oULA3I+Qi/UB4OV2KWVMVVjjh64HXi5OgZJr61btUwU4mQZH6o64Y
 wBzg6MDI2q2beKu0SoZCpbOOlDoudTjrcrLsl0fIvca/sCZ0Eo8KPH3BdCEmx+qozC1U
 WM1sr9dzWan45IIus1row/MlQ1y8C1EMQYLTVMNYNUhzRfB2e1KzQfLYjhSfKccT6xYO
 OTwdrMz4/80oj/3u+0ZHViBtdbDgBrw6YJLHj63JcRP4A4S70rXI0WsSI8bjPSw589b7 PA== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q5r0uskme-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 24 Apr 2023 23:16:29 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33ONGSaS006868
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 24 Apr 2023 23:16:28 GMT
Received: from hu-eberman-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Mon, 24 Apr 2023 16:16:27 -0700
From:   Elliot Berman <quic_eberman@quicinc.com>
To:     Alex Elder <elder@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Prakruthi Deepak Heragu <quic_pheragu@quicinc.com>,
        Jonathan Corbet <corbet@lwn.net>
CC:     Murali Nalajala <quic_mnalajal@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
        Carl van Schaik <quic_cvanscha@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad Dybcio" <konrad.dybcio@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Will Deacon <will@kernel.org>, Andy Gross <agross@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v12 01/25] docs: gunyah: Introduce Gunyah Hypervisor
Date:   Mon, 24 Apr 2023 16:15:34 -0700
Message-ID: <20230424231558.70911-2-quic_eberman@quicinc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230424231558.70911-1-quic_eberman@quicinc.com>
References: <20230424231558.70911-1-quic_eberman@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 7ZfKVPC2_ApCkI7lct8pkBoUiwbRS7lx
X-Proofpoint-ORIG-GUID: 7ZfKVPC2_ApCkI7lct8pkBoUiwbRS7lx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-24_11,2023-04-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 mlxscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 lowpriorityscore=0 clxscore=1011
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304240211
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Gunyah is an open-source Type-1 hypervisor developed by Qualcomm. It
does not depend on any lower-privileged OS/kernel code for its core
functionality. This increases its security and can support a smaller
trusted computing based when compared to Type-2 hypervisors.

Add documentation describing the Gunyah hypervisor and the main
components of the Gunyah hypervisor which are of interest to Linux
virtualization development.

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
---
 Documentation/virt/gunyah/index.rst         | 113 ++++++++++++++++++++
 Documentation/virt/gunyah/message-queue.rst |  63 +++++++++++
 Documentation/virt/index.rst                |   1 +
 3 files changed, 177 insertions(+)
 create mode 100644 Documentation/virt/gunyah/index.rst
 create mode 100644 Documentation/virt/gunyah/message-queue.rst

diff --git a/Documentation/virt/gunyah/index.rst b/Documentation/virt/gunyah/index.rst
new file mode 100644
index 000000000000..74aa345e0a14
--- /dev/null
+++ b/Documentation/virt/gunyah/index.rst
@@ -0,0 +1,113 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=================
+Gunyah Hypervisor
+=================
+
+.. toctree::
+   :maxdepth: 1
+
+   message-queue
+
+Gunyah is a Type-1 hypervisor which is independent of any OS kernel, and runs in
+a higher CPU privilege level. It does not depend on any lower-privileged operating system
+for its core functionality. This increases its security and can support a much smaller
+trusted computing base than a Type-2 hypervisor.
+
+Gunyah is an open source hypervisor. The source repo is available at
+https://github.com/quic/gunyah-hypervisor.
+
+Gunyah provides these following features.
+
+- Scheduling:
+
+  A scheduler for virtual CPUs (vCPUs) on physical CPUs enables time-sharing
+  of the CPUs. Gunyah supports two models of scheduling:
+
+    1. "Behind the back" scheduling in which Gunyah hypervisor schedules vCPUS on its own.
+    2. "Proxy" scheduling in which a delegated VM can donate part of one of its vCPU slice
+       to another VM's vCPU via a hypercall.
+
+- Memory Management:
+
+  APIs handling memory, abstracted as objects, limiting direct use of physical
+  addresses. Memory ownership and usage tracking of all memory under its control.
+  Memory partitioning between VMs is a fundamental security feature.
+
+- Interrupt Virtualization:
+
+  Uses CPU hardware interrupt virtualization capabilities. Interrupts are handled
+  in the hypervisor and routed to the assigned VM.
+
+- Inter-VM Communication:
+
+  There are several different mechanisms provided for communicating between VMs.
+
+- Virtual platform:
+
+  Architectural devices such as interrupt controllers and CPU timers are directly provided
+  by the hypervisor as well as core virtual platform devices and system APIs such as ARM PSCI.
+
+- Device Virtualization:
+
+  Para-virtualization of devices is supported using inter-VM communication.
+
+Architectures supported
+=======================
+AArch64 with a GIC
+
+Resources and Capabilities
+==========================
+
+Some services or resources provided by the Gunyah hypervisor are described to a virtual machine by
+capability IDs. For instance, inter-VM communication is performed with doorbells and message queues.
+Gunyah allows access to manipulate that doorbell via the capability ID. These resources are
+described in Linux as a struct gh_resource.
+
+High level management of these resources is performed by the resource manager VM. RM informs a
+guest VM about resources it can access through either the device tree or via guest-initiated RPC.
+
+For each virtual machine, Gunyah maintains a table of resources which can be accessed by that VM.
+An entry in this table is called a "capability" and VMs can only access resources via this
+capability table. Hence, virtual Gunyah resources are referenced by a "capability IDs" and not
+"resource IDs". If 2 VMs have access to the same resource, they might not be using the same
+capability ID to access that resource since the capability tables are independent per VM.
+
+Resource Manager
+================
+
+The resource manager (RM) is a privileged application VM supporting the Gunyah Hypervisor.
+It provides policy enforcement aspects of the virtualization system. The resource manager can
+be treated as an extension of the Hypervisor but is separated to its own partition to ensure
+that the hypervisor layer itself remains small and secure and to maintain a separation of policy
+and mechanism in the platform. RM runs at arm64 NS-EL1 similar to other virtual machines.
+
+Communication with the resource manager from each guest VM happens with message-queue.rst. Details
+about the specific messages can be found in drivers/virt/gunyah/rsc_mgr.c
+
+::
+
+  +-------+   +--------+   +--------+
+  |  RM   |   |  VM_A  |   |  VM_B  |
+  +-.-.-.-+   +---.----+   +---.----+
+    | |           |            |
+  +-.-.-----------.------------.----+
+  | | \==========/             |    |
+  |  \========================/     |
+  |            Gunyah               |
+  +---------------------------------+
+
+The source for the resource manager is available at https://github.com/quic/gunyah-resource-manager.
+
+The resource manager provides the following features:
+
+- VM lifecycle management: allocating a VM, starting VMs, destruction of VMs
+- VM access control policy, including memory sharing and lending
+- Interrupt routing configuration
+- Forwarding of system-level events (e.g. VM shutdown) to owner VM
+
+When booting a virtual machine which uses a devicetree such as Linux, resource manager overlays a
+/hypervisor node. This node can let Linux know it is running as a Gunyah guest VM,
+how to communicate with resource manager, and basic description and capabilities of
+this VM. See Documentation/devicetree/bindings/firmware/gunyah-hypervisor.yaml for a description
+of this node.
diff --git a/Documentation/virt/gunyah/message-queue.rst b/Documentation/virt/gunyah/message-queue.rst
new file mode 100644
index 000000000000..b352918ae54b
--- /dev/null
+++ b/Documentation/virt/gunyah/message-queue.rst
@@ -0,0 +1,63 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Message Queues
+==============
+Message queue is a simple low-capacity IPC channel between two VMs. It is
+intended for sending small control and configuration messages. Each message
+queue is unidirectional, so a full-duplex IPC channel requires a pair of queues.
+
+Messages can be up to 240 bytes in length. Longer messages require a further
+protocol on top of the message queue messages themselves. For instance, communication
+with the resource manager adds a header field for sending longer messages via multiple
+message fragments.
+
+The diagram below shows how message queue works. A typical configuration involves
+2 message queues. Message queue 1 allows VM_A to send messages to VM_B. Message
+queue 2 allows VM_B to send messages to VM_A.
+
+1. VM_A sends a message of up to 240 bytes in length. It raises a hypercall
+   with the message to inform the hypervisor to add the message to
+   message queue 1's queue. The hypervisor copies memory into the internal
+   message queue representation; the memory doesn't need to be shared between
+   VM_A and VM_B.
+
+2. Gunyah raises the corresponding interrupt for VM_B (Rx vIRQ) when any of
+   these happens:
+
+   a. gh_msgq_send() has PUSH flag. Queue is immediately flushed. This is the typical case.
+   b. Explicility with gh_msgq_push command from VM_A.
+   c. Message queue has reached a threshold depth.
+
+3. VM_B calls gh_msgq_recv() and Gunyah copies message to requested buffer.
+
+4. Gunyah buffers messages in the queue. If the queue became full when VM_A added a message,
+   the return values for gh_msgq_send() include a flag that indicates the queue is full.
+   Once VM_B receives the message and, thus, there is space in the queue, Gunyah
+   will raise the Tx vIRQ on VM_A to indicate it can continue sending messages.
+
+For VM_B to send a message to VM_A, the process is identical, except that hypercalls
+reference message queue 2's capability ID. Each message queue has its own independent
+vIRQ: two TX message queues will have two vIRQs (and two capability IDs).
+
+::
+
+      +---------------+         +-----------------+         +---------------+
+      |      VM_A     |         |Gunyah hypervisor|         |      VM_B     |
+      |               |         |                 |         |               |
+      |               |         |                 |         |               |
+      |               |   Tx    |                 |         |               |
+      |               |-------->|                 | Rx vIRQ |               |
+      |gh_msgq_send() | Tx vIRQ |Message queue 1  |-------->|gh_msgq_recv() |
+      |               |<------- |                 |         |               |
+      |               |         |                 |         |               |
+      | Message Queue |         |                 |         | Message Queue |
+      | driver        |         |                 |         | driver        |
+      |               |         |                 |         |               |
+      |               |         |                 |         |               |
+      |               |         |                 |   Tx    |               |
+      |               | Rx vIRQ |                 |<--------|               |
+      |gh_msgq_recv() |<--------|Message queue 2  | Tx vIRQ |gh_msgq_send() |
+      |               |         |                 |-------->|               |
+      |               |         |                 |         |               |
+      |               |         |                 |         |               |
+      +---------------+         +-----------------+         +---------------+
diff --git a/Documentation/virt/index.rst b/Documentation/virt/index.rst
index 7fb55ae08598..15869ee059b3 100644
--- a/Documentation/virt/index.rst
+++ b/Documentation/virt/index.rst
@@ -16,6 +16,7 @@ Virtualization Support
    coco/sev-guest
    coco/tdx-guest
    hyperv/index
+   gunyah/index
 
 .. only:: html and subproject
 
-- 
2.40.0

