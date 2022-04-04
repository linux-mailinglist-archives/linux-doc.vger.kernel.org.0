Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E26A54F1CC3
	for <lists+linux-doc@lfdr.de>; Mon,  4 Apr 2022 23:29:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380208AbiDDV2u (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 4 Apr 2022 17:28:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379669AbiDDRqk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 4 Apr 2022 13:46:40 -0400
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79C0C13EBA;
        Mon,  4 Apr 2022 10:44:44 -0700 (PDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 234Haknx033485;
        Mon, 4 Apr 2022 17:44:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=AjtQsh5rW+jDZVIqwf3G/i+49LUHP0WqDT2JEw/jxhA=;
 b=QuTWcXTVWgZdG1CjdQttCsqwViFZo2xbB/R08eEcnKZb6l3VUAJP24bzXrZ5d0XilMV+
 2/xsTuPe4j3zKkJ5Ir4Ju+Deph+EMiar444sYavCUim2FzfB3sR5kHFgAb/ibyxGXyka
 QtREaMvwp3BGZ7fhNTvzZpZkL9sru8HbC18jL3a77y25JE8TiMIMTlJ4zMpq3IkJudGM
 fSNYjWovds8R0l6QXo3UxBZJv0JSZNr42CFZjk7Zswvb2onh0DpzajHG+QuZZ2NiFNEH
 oLSI4JdQDahZ8SBnaJTnjYtyqmZ6/AeB0ixUCqJe8936xHmwQeMcdMytDz0XaeFH2o6S 5A== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 3f82rbwm0j-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 04 Apr 2022 17:44:43 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 234Hf1km008436;
        Mon, 4 Apr 2022 17:44:43 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
        by mx0a-001b2d01.pphosted.com with ESMTP id 3f82rbwm00-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 04 Apr 2022 17:44:43 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
        by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 234HhLKX026081;
        Mon, 4 Apr 2022 17:44:42 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
        by ppma01dal.us.ibm.com with ESMTP id 3f6e49ng92-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 04 Apr 2022 17:44:42 +0000
Received: from b03ledav002.gho.boulder.ibm.com (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
        by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 234Hiew313959424
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 4 Apr 2022 17:44:40 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 50FF113605E;
        Mon,  4 Apr 2022 17:44:40 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 432CC136051;
        Mon,  4 Apr 2022 17:44:38 +0000 (GMT)
Received: from li-c92d2ccc-254b-11b2-a85c-a700b5bfb098.ibm.com.com (unknown [9.211.32.125])
        by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
        Mon,  4 Apr 2022 17:44:38 +0000 (GMT)
From:   Matthew Rosato <mjrosato@linux.ibm.com>
To:     linux-s390@vger.kernel.org
Cc:     alex.williamson@redhat.com, cohuck@redhat.com,
        schnelle@linux.ibm.com, farman@linux.ibm.com, pmorel@linux.ibm.com,
        borntraeger@linux.ibm.com, hca@linux.ibm.com, gor@linux.ibm.com,
        gerald.schaefer@linux.ibm.com, agordeev@linux.ibm.com,
        svens@linux.ibm.com, frankja@linux.ibm.com, david@redhat.com,
        imbrenda@linux.ibm.com, vneethv@linux.ibm.com,
        oberpar@linux.ibm.com, freude@linux.ibm.com, thuth@redhat.com,
        pasic@linux.ibm.com, pbonzini@redhat.com, corbet@lwn.net,
        kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: [PATCH v5 19/21] KVM: s390: add KVM_S390_ZPCI_OP to manage guest zPCI devices
Date:   Mon,  4 Apr 2022 13:43:47 -0400
Message-Id: <20220404174349.58530-20-mjrosato@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220404174349.58530-1-mjrosato@linux.ibm.com>
References: <20220404174349.58530-1-mjrosato@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: _QYHELKmVqeGwRvnaizSRh1Me4cnqxV4
X-Proofpoint-ORIG-GUID: 4CJU_bN5gQ91uAu6kADft5KeALA-Llx-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-04_06,2022-03-31_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 mlxscore=0 impostorscore=0 bulkscore=0
 adultscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204040099
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The KVM_S390_ZPCI_OP ioctl provides a mechanism for managing
hardware-assisted virtualization features for s390X zPCI passthrough.
Add the first 2 operations, which can be used to enable/disable
the specified device for Adapter Event Notification interpretation.

Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
---
 Documentation/virt/kvm/api.rst | 45 +++++++++++++++++++++++
 arch/s390/kvm/kvm-s390.c       | 23 ++++++++++++
 arch/s390/kvm/pci.c            | 65 ++++++++++++++++++++++++++++++++++
 arch/s390/kvm/pci.h            |  2 ++
 include/uapi/linux/kvm.h       | 31 ++++++++++++++++
 5 files changed, 166 insertions(+)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index d13fa6600467..474f502c2ea0 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -5645,6 +5645,51 @@ enabled with ``arch_prctl()``, but this may change in the future.
 The offsets of the state save areas in struct kvm_xsave follow the contents
 of CPUID leaf 0xD on the host.
 
+4.135 KVM_S390_ZPCI_OP
+--------------------
+
+:Capability: KVM_CAP_S390_ZPCI_OP
+:Architectures: s390
+:Type: vcpu ioctl
+:Parameters: struct kvm_s390_zpci_op (in)
+:Returns: 0 on success, <0 on error
+
+Used to manage hardware-assisted virtualization features for zPCI devices.
+
+Parameters are specified via the following structure::
+
+  struct kvm_s390_zpci_op {
+	/* in */
+	__u32 fh;		/* target device */
+	__u8  op;		/* operation to perform */
+	__u8  pad[3];
+	union {
+		/* for KVM_S390_ZPCIOP_REG_AEN */
+		struct {
+			__u64 ibv;	/* Guest addr of interrupt bit vector */
+			__u64 sb;	/* Guest addr of summary bit */
+			__u32 flags;
+			__u32 noi;	/* Number of interrupts */
+			__u8 isc;	/* Guest interrupt subclass */
+			__u8 sbo;	/* Offset of guest summary bit vector */
+			__u16 pad;
+		} reg_aen;
+		__u64 reserved[8];
+	} u;
+  };
+
+The type of operation is specified in the "op" field.
+KVM_S390_ZPCIOP_REG_AEN is used to register the VM for adapter event
+notification interpretation, which will allow firmware delivery of adapter
+events directly to the vm, with KVM providing a backup delivery mechanism;
+KVM_S390_ZPCIOP_DEREG_AEN is used to subsequently disable interpretation of
+adapter event notifications.
+
+The target zPCI function must also be specified via the "fh" field.  For the
+KVM_S390_ZPCIOP_REG_AEN operation, additional information to establish firmware
+delivery must be provided via the "reg_aen" struct.
+
+The "reserved" field is meant for future extensions.
 
 5. The kvm_run structure
 ========================
diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
index 704d85214f4f..65a53e22f686 100644
--- a/arch/s390/kvm/kvm-s390.c
+++ b/arch/s390/kvm/kvm-s390.c
@@ -616,6 +616,12 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 	case KVM_CAP_S390_PROTECTED:
 		r = is_prot_virt_host();
 		break;
+	case KVM_CAP_S390_ZPCI_OP:
+		if (kvm_s390_pci_interp_allowed())
+			r = 1;
+		else
+			r = 0;
+		break;
 	default:
 		r = 0;
 	}
@@ -2621,6 +2627,23 @@ long kvm_arch_vm_ioctl(struct file *filp,
 			r = -EFAULT;
 		break;
 	}
+	case KVM_S390_ZPCI_OP: {
+		struct kvm_s390_zpci_op args;
+
+		r = -EINVAL;
+		if (!IS_ENABLED(CONFIG_VFIO_PCI))
+			break;
+		if (copy_from_user(&args, argp, sizeof(args))) {
+			r = -EFAULT;
+			break;
+		}
+		r = kvm_s390_pci_zpci_op(kvm, &args);
+		if (r)
+			break;
+		if (copy_to_user(argp, &args, sizeof(args)))
+			r = -EFAULT;
+		break;
+	}
 	default:
 		r = -ENOTTY;
 	}
diff --git a/arch/s390/kvm/pci.c b/arch/s390/kvm/pci.c
index 66565f5f3f43..d941657bcb39 100644
--- a/arch/s390/kvm/pci.c
+++ b/arch/s390/kvm/pci.c
@@ -588,6 +588,71 @@ void kvm_s390_pci_clear_list(struct kvm *kvm)
 		unregister_kvm(kzdev->zdev);
 }
 
+static struct kvm_zdev *get_kzdev_by_fh(struct kvm *kvm, u32 fh)
+{
+	struct kvm_zdev *kzdev, *retval = NULL;
+
+	spin_lock(&kvm->arch.kzdev_list_lock);
+	list_for_each_entry(kzdev, &kvm->arch.kzdev_list, entry) {
+		if (kzdev->zdev->fh == fh) {
+			retval = kzdev;
+			break;
+		}
+	}
+	spin_unlock(&kvm->arch.kzdev_list_lock);
+
+	return retval;
+}
+
+static int kvm_s390_pci_zpci_reg_aen(struct zpci_dev *zdev,
+				     struct kvm_s390_zpci_op *args)
+{
+	struct zpci_fib fib = {};
+
+	fib.fmt0.aibv = args->u.reg_aen.ibv;
+	fib.fmt0.isc = args->u.reg_aen.isc;
+	fib.fmt0.noi = args->u.reg_aen.noi;
+	if (args->u.reg_aen.sb != 0) {
+		fib.fmt0.aisb = args->u.reg_aen.sb;
+		fib.fmt0.aisbo = args->u.reg_aen.sbo;
+		fib.fmt0.sum = 1;
+	} else {
+		fib.fmt0.aisb = 0;
+		fib.fmt0.aisbo = 0;
+		fib.fmt0.sum = 0;
+	}
+
+	if (args->u.reg_aen.flags & KVM_S390_ZPCIOP_REGAEN_HOST)
+		return kvm_s390_pci_aif_enable(zdev, &fib, true);
+	else
+		return kvm_s390_pci_aif_enable(zdev, &fib, false);
+}
+
+int kvm_s390_pci_zpci_op(struct kvm *kvm, struct kvm_s390_zpci_op *args)
+{
+	struct kvm_zdev *kzdev;
+	struct zpci_dev *zdev;
+	int r;
+
+	kzdev = get_kzdev_by_fh(kvm, args->fh);
+	if (!kzdev)
+		return -ENODEV;
+	zdev = kzdev->zdev;
+
+	switch (args->op) {
+	case KVM_S390_ZPCIOP_REG_AEN:
+		r = kvm_s390_pci_zpci_reg_aen(zdev, args);
+		break;
+	case KVM_S390_ZPCIOP_DEREG_AEN:
+		r = kvm_s390_pci_aif_disable(zdev, false);
+		break;
+	default:
+		r = -EINVAL;
+	}
+
+	return r;
+}
+
 int kvm_s390_pci_init(void)
 {
 	aift = kzalloc(sizeof(struct zpci_aift), GFP_KERNEL);
diff --git a/arch/s390/kvm/pci.h b/arch/s390/kvm/pci.h
index cb5ec3208923..b053b50c0904 100644
--- a/arch/s390/kvm/pci.h
+++ b/arch/s390/kvm/pci.h
@@ -59,6 +59,8 @@ void kvm_s390_pci_aen_exit(void);
 void kvm_s390_pci_init_list(struct kvm *kvm);
 void kvm_s390_pci_clear_list(struct kvm *kvm);
 
+int kvm_s390_pci_zpci_op(struct kvm *kvm, struct kvm_s390_zpci_op *args);
+
 int kvm_s390_pci_init(void);
 
 static inline bool kvm_s390_pci_interp_allowed(void)
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 91a6fe4e02c0..014adb30d42c 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -1144,6 +1144,7 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_S390_MEM_OP_EXTENSION 211
 #define KVM_CAP_PMU_CAPABILITY 212
 #define KVM_CAP_DISABLE_QUIRKS2 213
+#define KVM_CAP_S390_ZPCI_OP 214
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
@@ -2060,4 +2061,34 @@ struct kvm_stats_desc {
 /* Available with KVM_CAP_XSAVE2 */
 #define KVM_GET_XSAVE2		  _IOR(KVMIO,  0xcf, struct kvm_xsave)
 
+/* Available with KVM_CAP_S390_ZPCI_OP */
+#define KVM_S390_ZPCI_OP	  _IOW(KVMIO,  0xd0, struct kvm_s390_zpci_op)
+
+struct kvm_s390_zpci_op {
+	/* in */
+	__u32 fh;		/* target device */
+	__u8  op;		/* operation to perform */
+	__u8  pad[3];
+	union {
+		/* for KVM_S390_ZPCIOP_REG_AEN */
+		struct {
+			__u64 ibv;	/* Guest addr of interrupt bit vector */
+			__u64 sb;	/* Guest addr of summary bit */
+			__u32 flags;
+			__u32 noi;	/* Number of interrupts */
+			__u8 isc;	/* Guest interrupt subclass */
+			__u8 sbo;	/* Offset of guest summary bit vector */
+			__u16 pad;
+		} reg_aen;
+		__u64 reserved[8];
+	} u;
+};
+
+/* types for kvm_s390_zpci_op->op */
+#define KVM_S390_ZPCIOP_REG_AEN		0
+#define KVM_S390_ZPCIOP_DEREG_AEN	1
+
+/* flags for kvm_s390_zpci_op->u.reg_aen.flags */
+#define KVM_S390_ZPCIOP_REGAEN_HOST	(1 << 0)
+
 #endif /* __LINUX_KVM_H */
-- 
2.27.0

