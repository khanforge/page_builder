import { CMSData } from '@/types/cms';

// Import images as ES6 modules
import profileHero from '@/assets/profile-hero.jpg';

/**
 * Sample CMS Data - Replace with API call later
 * This data structure mirrors what your backend API will return
 * 
 * To connect to API, replace the sampleCMSData import with a fetch call:
 * const response = await fetch('/api/portfolio');
 * const data = await response.json();
 */
export const sampleCMSData: CMSData = [
  {
    id: 14,
    title: "Home",
    slug: "",
    profile: {
      id: 2,
      image: profileHero,
      image_badge: "Professor at NIT Delhi",
      designation: "Assistant Professor",
      organisation: "National Institute of Technology, Delhi",
      org_short_name: "NIT Delhi",
      address: "National Institute of Technology Delhi, Plot No. FA7, Zone P1, GT Karnal Road, Delhi-110036",
      badge: "",
      user: 2,
      link: [1]
    },
    keyword: null,
    footer: null,
    components: [
      {
        id: 6,
        title: "Research Summary",
        slug: "research-summary",
        is_active: true,
        layout: "default",
        sub_components: [
          {
            id: 24,
            title: "",
            is_active: true,
            content_blocks: [
              {
                id: 34,
                content_type: "text",
                data: "I study the structure and dynamics of large networks, with a particular emphasis on information propagation and information control over it with and without Community Structure. I also study the modelling of large dynamic communication networks and its performance. Link prediction in monoplex and multiplex networks.",
                order: 0,
                is_active: true
              }
            ]
          }
        ]
      },
      {
        id: 7,
        title: "Areas of Interest",
        slug: "areas-of-interest",
        is_active: true,
        layout: "cards",
        sub_components: [
          {
            id: 25,
            title: "",
            is_active: true,
            content_blocks: [
              {
                id: 35,
                content_type: "list",
                data: [
                  "Machine Learning & AI: Machine Learning, Federated Learning, Video Analysis, Video Captioning, Recommender Systems",
                  "Networks & Graph Theory: Complex Networks, Social Network Analysis, Network Reconstruction, Graph Spectra, Time-Varying Networks",
                  "Systems & Applications: Intelligent Transportation Systems, Efficient Routing in Communication Networks",
                  "Data & Modeling: Data Analytics, Opinion Dynamics, Mathematical Modeling of Epidemic Spreading"
                ],
                order: 0,
                is_active: true
              }
            ]
          }
        ]
      },
      {
        id: 8,
        title: "Teaching and Mentoring",
        slug: "teaching-and-mentoring",
        is_active: true,
        layout: "default",
        sub_components: [
          {
            id: 26,
            title: "",
            is_active: true,
            content_blocks: [
              {
                id: 36,
                content_type: "text",
                data: "I have extensive teaching experience at both undergraduate and graduate levels. I began my academic career as a Lecturer at Ajay Kumar Garg Engineering College, Ghaziabad, and later served as an Assistant Professor at Maharaja Agrasen Institute of Technology, Delhi. During my Ph.D., I worked as a Teaching Assistant and Tutor at the Indian Institute of Technology Kanpur and the Indian Institute of Technology Rajasthan. After completing my Ph.D., I joined PDPM Indian Institute of Information Technology, Manufacturing and Design (IIITDM), Jabalpur, and subsequently the National Institute of Technology (NIT) Delhi. I have taught a wide range of courses, from introductory to advanced and specialized topics, in Computer Science and Engineering as well as Mathematics. Currently, I mentor undergraduate, postgraduate, and doctoral students at NIT Delhi and supervise Ph.D. scholars.",
                order: 0,
                is_active: true
              }
            ]
          }
        ]
      },
      {
        id: 9,
        title: "Research Areas",
        slug: "research-areas",
        is_active: true,
        layout: "default",
        sub_components: [
          {
            id: 27,
            title: "",
            is_active: true,
            content_blocks: [
              {
                id: 37,
                content_type: "text",
                data: "Information dynamics in correlated and uncorrelated Complex networks, Inoculation of nodes in Complex Networks, Dynamics on Networks using the community structure of Complex Networks, Epidemic modeling over human contact networks, Data Analytics, Video Captioning, Network Reconstruction",
                order: 0,
                is_active: true
              }
            ]
          }
        ]
      },
      {
        id: 10,
        title: "Recent Publications",
        slug: "recent-publications",
        is_active: true,
        layout: "publications",
        sub_components: [
          {
            id: 28,
            title: "",
            is_active: true,
            content_blocks: [
              {
                id: 38,
                content_type: "list",
                data: [
                  "KK Saha, P Kumar, A Singh, B Kamranzad, IR Young (2025). \"Assessment and Future Projections of Storm Surge Using CMIP6 Models in the Indo-Pacific Region\". Ocean Modelling, 102560.",
                  "R Prasad, P Kumar, A Singh, A Sunil, A Kumar, A Patra (2025). \"Trend analysis of extreme wind and wave height at key port locations along the Indian coastline\". Thalassas: An International Journal of Marine Sciences 41 (1), 1-23.",
                  "B Sajja, A Singh (2025). \"Detection of Violent Content in Videos Using Attention-Augmented 3D Convolutional Networks\". IEEE MultiMedia.",
                  "V Sharma, A Singh, S Gaito (2025). \"Indian Sign Language recognition and translation: An Encoder-Decoder Approach\". 17th International Conference on COMmunication Systems and NETworks.",
                  "AK Singhal, S Manhas, A Singh (2025). \"Beyond the traditional models: a network reconstruction based model for predicting and analysing individual health status\". Computing 107 (1), 1-21.",
                  "A Jha, A Singh, H Cherifi (2024). \"Synchronisation in Higher Order Network of Simplicial Complexes\". International Conference on Complex Networks and Their Applications.",
                  "Singhal, A. K., & Singh, A. (2024). Mapping health pathways: A network analysis for improved illness prediction. Concurrency and Computation: Practice and Experience, e8301.",
                  "Kumar, Pankaj, Singh, Anurag, and Ajay K. Sharma. \"Identification of influential vertices in complex networks: A hitting time-based approach.\" Journal of Concurrency and Computation: Practice and Experience e8031 (2024).",
                  "V. Sharma, A. Singh and S. Gaito, \"Object Centered Video Captioning using Spatio-temporal Graphs,\" 2024 IEEE International Conference on Interdisciplinary Approaches in Technology and Management for Social Innovation (IATMSI), Gwalior, India, 2024.",
                  "A. Singh, P. Singh, V. Sharma, D. Tyagi, N. Pandey and B. Vaid, \"Palanam: A Deep Learning Based Childhood Defense System,\" 2024 16th International Conference on COMmunication Systems & NETworkS (COMSNETS), Bengaluru, India, 2024, pp. 273-275",
                  "V. Sharma, A. Singh and S. Gaito, \"Video Captioning using Spatio-temporal Graphs: An Encoder-Decoder Approach,\" 2024 16th International Conference on COMmunication Systems & NETworkS (COMSNETS), Bengaluru, India, 2024, pp. 424-426.",
                  "A. K. Singhal, S. Manhas and A. Singh, \"Health Prediction Using Network Reconstruction Based Model,\" 2024 16th International Conference on COMmunication Systems & NETworkS (COMSNETS), Bengaluru, India, 2024, pp. 409-411."
                ],
                order: 0,
                is_active: true
              }
            ]
          }
        ]
      }
    ]
  }
];
